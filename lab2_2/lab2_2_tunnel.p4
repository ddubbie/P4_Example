#define XLAN_ETYPE 0x9999
/*******************************************************/
header_type eth_hdr {
    fields {
        dst : 48;
        src : 48;
        etype : 16;
    }
}

header_type xlan_hdr {
    fields {
        tag : 32;
        etype : 16;
    }
}

/*******************************************************/

header eth_hdr eth;
header xlan_hdr xlan;

/*******************************************************/

parser start {
    return eth_parse;
}

parser eth_parse {
    extract(eth);
    return select(eth.etype) {
        XLAN_ETYPE : xlan_parse;
        default : ingress;
    }
}

parser xlan_parse {
    extract(xlan);
    return ingress;
}

/*******************************************************/

action encap_act(prt, tag) {
    modify_field(standard_metadata.egress_spec, prt);
    xlan_encap(tag);
}

action xlan_encap(tag) {
    add_header(xlan);
    modify_field(xlan.tag, tag);
    modify_field(xlan.etype, eth.etype);
    modify_field(eth.etype, XLAN_ETYPE);

    /* Add counter */
    count(encap_counter, 0);
}
action decap_act(prt) {
    modify_field(standard_metadata.egress_spec, prt);
    modify_field(eth.etype, xlan.etype);
    remove_header(xlan);
    count(decap_counter, 0);
}

action drop_act(){
    drop();
}

/*******************************************************/


table encap_tbl {
    reads {
        standard_metadata.ingress_port : exact;
    }
    actions {
        encap_act;
        drop_act;
    }
}
table decap_tbl {
    reads {
        standard_metadata.ingress_port : exact;
    }
    actions {
        decap_act;
        drop_act;
    }
}

/*******************************************************/


control ingress {
    if(valid(xlan)) {
        apply(decap_tbl);
    } else {
        apply(encap_tbl);
    }
}

/*******************************************************/

counter encap_counter {
    type : packets;
    instance_count : 1;
}

counter decap_counter {
    type : bytes;
    instance_count : 1;
}



/*******************************************************/
/*
    start ----> eth_parse ---> xlan_parse 
                    |                | 
                    |                |
                    --------------ingress -----------> encap_act
                                          |
                                          -----------> decap_act


    - Packet structure
           -----------
           | eth_hdr |
           -----------
           |  xlan   |
           -----------
*/
