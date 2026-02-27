seeds:
  - name: payment_type_lookup
    columns:
      - name: payment_type
        description: Numeric code for payment type
        data_tests:
          - unique
          - not_null