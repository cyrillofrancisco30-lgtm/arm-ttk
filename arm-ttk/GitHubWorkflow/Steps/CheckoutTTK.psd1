gh workflow run run-unit-tests.yml \
  --repo cyrillofrancisco30-lgtm/arm-ttk \
  --ref master

gh run list \
  --repo cyrillofrancisco30-lgtm/arm-ttk \
  --workflow run-unit-tests.yml \
  --limit 5


- name: Checkout TTK
  uses: actions/checkout@v4
  id: CheckoutTTK
  with:
    repository: Azure/arm-ttk
    path: ttk


