#include "parser.p4"
#include "headers.p4"
#include "checksum.p4"

action fwd_act(prt) {
    modify_field(standard_metadata.egress_spec, prt);
}

action drop_act()  {
    drop();
}

table fwd_tbl {
    reads {
        standard_metadata.ingress_port : exact; 
    }
    actions {
        fwd_act;
        drop_act;
    }
}

control ingress {
    apply(fwd_tbl);
}

