{% macro get_vendor_data(vendor_id) %}

{% set vendors = {
    1: 'Creative Mobile Technologies',
    2: 'VeriFone Inc.',
    4: 'Unknown/Other'
} %}

case {{vendor_id}}
    {%  for v_id, v_name in vendors.items() %}
        when {{v_id}} then "{{v_name}}"
    {% endfor %}
end

{% endmacro %}