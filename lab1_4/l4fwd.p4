header_type eth_hdr{
	fields{
		dst : 48;
		src : 48;
		etype : 16;
	}
}

header eth_hdr eth;

parser start{
	return eth_parse;
}

parser eth_parse{
	extract(eth);
	return ingress;
}

action fwd_act(prt) {
	modify_field(standard_metadata.egress_spec, prt);
}
action drop_act()
{
	drop();
}

table in_tbl{
	reads {
		standard_metadata.ingress_port : exact;
	}
	actions {
		fwd_act;
		drop_act;
	}
}

control ingress{
	apply(in_tbl);
}

/*
eth ---> eth_parse ---> ingress ---> fwd_act
								|
								|(tbl)
								|
								---> drop_act

standard_metadata.egress_spec --- 

Rule Description :
    if ingress port is vf0_0   -------------> Push a packet to p0
    else drop

*/


