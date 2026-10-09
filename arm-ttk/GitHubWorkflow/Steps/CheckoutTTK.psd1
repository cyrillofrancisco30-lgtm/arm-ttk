disparar workflow 

workflow run run-unit-tests.yml \
  --repo cyrillofrancisco30-lgtm/arm-ttk \
  --ref master


gh run list \
  --repo cyrillofrancisco30-lgtm/arm-ttk \
  --workflow run-unit-tests.yml \
  --limit 5

gh run view RUN_ID \
  --repo cyrillofrancisco30-lgtm/arm-ttk \
  --json databaseId,status,conclusion,headSha,attempt,jobs

﻿@{
    name = 'Checkout TTK'
    uses = 'actions/checkout@v2'
    id = 'CheckoutTTK'
    with = @{
        # Exclude = '*.tests.ps1;*.psdevops.ps1'
        repository = 'Azure/arm-ttk'
        path = 'ttk'
    }
}
{
  "decision": "REVIEW",
  "reasons": [
    "SETTLEMENT_ROUTE_NOT_VERIFIED"
  ],
  "settlement_route_verified": null,
  "bank_transaction_performed": false,
  "ledger_persisted": false
}


