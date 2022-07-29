#include <pif_plugin.h>

#define IP_ADDR(a, b, c, d) ((a << 24) | (b << 16) | (c << 8) | d )
int
pif_plugin_filter_func(EXTRACTED_HEADERS_T *headers, MATCH_DATA_T *data)
{
    PIF_PLUGIN_ipv4_T *ipv4;

    if (!pif_plugin_hdr_ipv4_present(headers)) {
        return PIF_PLUGIN_RETURN_DROP;
    }

    ipv4 = pif_plugin_hdr_get_ipv4(headers);

    if (ipv4->dst == IP_ADDR(10, 1, 100, 31)) {
        return PIF_PLUGIN_RETURN_DROP;
    }
    return PIF_PLUGIN_RETURN_FORWARD;
}

