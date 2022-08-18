// Header definition
header_type eth_hdr {
    fields {
        dst : 48;
        src : 48;
        etype : 16;
    }
}

header_type ipv4_hdr {
    fields {
        ver : 4;
        ihl : 4;
        tos : 8;
        len : 16;
        id : 16;
        frag : 16;
        ttl : 8;
        proto : 8;
        csum : 16;
        src : 32;
        dst : 32;
    }
}

header_type tcp_hdr {
    fields {
        srcprt : 16;
        dstprt : 16;
        seqnum : 32;
        acknum : 32;
        offset : 4;
        res : 6;
        urg : 1;
        ack : 1;
        psh : 1;
        rst : 1;
        syn : 1;
        fin : 1;
        window : 16;
        tcpchk : 16;
        urgpntr : 16;
    }
}

// Header declaration
header eth_hdr eth;
header ipv4_hdr ipv4;
header tcp_hdr tcp;

// Parser
parser start {
    return eth_parse;
}

parser eth_parse {
    extract(eth);
    return ipv4_parse;
}

parser ipv4_parse {
    extract(ipv4);
    return tcp_parse;
}

parser tcp_parse {
    extract(tcp);
    return ingress;
}

/* Action */
action fwd_act(prt) {
    modify_field(standard_metadata.egress_spec, prt);
}
action drop_act(){
    drop();
}

/* Match-action table */
table in_tbl {
    reads {
        standard_metadata.ingress_port : exact;
    }
    actions {
        fwd_act;
        drop_act;
    }
}

/* Control */
control ingress {
    apply(in_tbl);
}



