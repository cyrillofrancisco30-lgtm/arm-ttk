

Consultei novamente o repositório cyrillofrancisco30-lgtm/arm-ttk. A API retornou:

{
  "total_count": 0,
  "workflow_runs": []
}



1. Dispare pelo GitHub CLI

No terminal em que você está autenticado no GitHub, execute:

gh workflow list \
  --repo cyrillofrancisco30-lgtm/arm-ttk

Confirme que run-unit-tests.yml aparece na lista. Depois, se o workflow aceitar workflow_dispatch:

gh workflow run run-unit-tests.yml \
  --repo cyrillofrancisco30-lgtm/arm-ttk \
  --ref master

Consulte as execuções:

gh run list \
  --repo cyrillofrancisco30-lgtm/arm-ttk \
  --workflow run-unit-tests.yml \
  --limit 5

Se houver uma nova execução, copie o ID numérico real e consulte-a:

gh run view ID_REAL \
  --repo cyrillofrancisco30-lgtm/arm-ttk \
  --json databaseId,status,conclusion,headSha,attempt,jobs

2. Sobre o trecho Checkout TTK

O trecho que você enviou declara o uso de actions/checkout@v2 para obter Azure/arm-ttk no diretório ttk.

Isso é configuração declarativa. Isoladamente, não prova que o checkout aconteceu nem que os testes foram executados.

3. Sobre a decisão de custódia

O resultado apresentado continua indicando:

{
  
  "reasons": ["SETTLEMENT_ROUTE_NOT_VERIFIED"],
  "settlement_route_verified": null,
  "bank_transaction_performed": false,
  "ledger_persisted": false
}

Esse resultado é compatível com uma decisão de revisão por falta de comprovação da rota de liquidação. demonstra uma transação bancária  persistência no ledger; 



gh workflow run run-unit-tests.yml \
--repo cyrillofrancisco30-lgtm/arm-ttk \
--ref master

gh run list \
--repo cyrillofrancisco30-lgtm/arm-ttk \
--workflow run-unit-tests.yml \
--limit 5

gh run view RUN_ID \
--repo cyrillofrancisco30-lgtm/arm-ttk \
--json databaseId,status,conclusion,headSha,attempt,jobs

result = verify_custody_with_bcb_policy(
    artifact_id="BCB-PIX-PARTICIPANTS-2026-08-24",
    counterparty_ispb="60746948",
    source_csv_path=CSV_PATH,
    expected_sha256=TRUSTED_REFERENCE_SHA256,
    policy_version="GT7-POLICY-2026-08-24-v1",
    bcb_dataframe=df,
    execution_id="EXEC-2026-10-09-001",
    settlement_route_verified=None,
)

{
  "decision": "REVIEW",
  "reasons": [
    "SETTLEMENT_ROUTE_NOT_VERIFIED"
  ],
  "settlement_route_verified": null,
  "bank_transaction_performed": false,
  "ledger_persisted": false
}9



if settlement_route_verified is not True:
    return {
        "decision": "REVIEW",
        "reasons": ["SETTLEMENT_ROUTE_NOT_VERIFIED"],
        "settlement_route_verified": None,
        "bank_transaction_performed": False,
        "ledger_persisted": False,
    }

Código → Commit → Build → Provenance → Artefato → Runtime → Modelo → Decisão
↓                                                    ↓
DEP (Decision Evidence Package) → Ledger → Replay → TRUST_STATUS = VERIFIED

TRUST_STATUS = VERIFIED  ⇔
source_verification = PASS
AND build_verification   = PASS
AND artifact_verification= PASS
AND cryptographic_verification = PASS
AND ledger_verification = PASS
AND replay_verification = MATCH

{
"request_id": "REQ-2026-001",
"decision_id": "DEC-2026-001",

"decision": {
"result": "APPROVED",
"model_version": "risk-engine-2.1",
"policy_version": "policy-2026.07"
},

"software": {
"name": "xa-banking-core",
"version": "9.6",
"artifact_hash": "sha256:4b5c6d7e8f9a0b1c2d3e4f5a6b7c8d9e0f1a2b3c4d5e6f708192a3b4c5d6e7f8"
},

"verification": {
"source_verification": "PASS",
"build_verification": "PASS",
"artifact_verification": "PASS",
"cryptographic_verification": "PASS",
"ledger_verification": "PASS",
"replay_verification": "MATCH"
},

"evidence": {
"dep_id": "DEP-2026-001",
"aer_id": "AER-2026-001",
"merkle_root": "sha256:5c6d7e8f9a0b1c2d3e4f5a6b7c8d9e0f1a2b3c4d5e6f708192a3b4c5d6e7f8a9"
},

"runtime": {
"attestation": "VALID",
"environment": "production"
},

"trust_status": "VERIFIED"
}


WORKFLOW/RUN_ID_OBSERVED
        ↓
ACTION_IDENTITY_BOUND
        ↓
STEP_IDENTITY_BOUND
        ↓
COMMIT/REF_BOUND
        ↓
COMMAND_EXECUTION_OBSERVED
        ↓
COMMAND_SEMANTICS_VALIDATED
        ↓
RESULT_OBSERVED
        ↓
INDEPENDENT_VERIFICATION
        ↓
VERIFIED_CLAIM
DECLARATIVE_CONFIGURATION = OBSERVED
COMMAND_DECLARATION       = OBSERVED
EXECUTION                  


    name = "Update TTK Cache"
    uses = "Azure/powershell@v1"
    with = @{
        "inlineScript" = @'
Get-ChildItem -Recurse -Filter arm-ttk.psd1 | Import-Module -Name { $_.FullName} -Force -PassThru | Out-String
Update-TTKCache
'@
        "azPSVersion" = "3.1.0"
    }
}
<#
name: Azure PowerShell Action
        uses: Azure/powershell@v1
        with:
          inlineScript: Get-AzVM -ResourceGroupName "< YOUR RESOURCE GROUP >"
          azPSVersion: 3.1.0
#>

FROZEN — TRUST DERIVATION PRINCIPLE

EVIDENCE ≠ DECISION
DECISION ≠ TRUST
TRUST ≠ INHERITANCE

IDENTITY ≠ EXECUTION
EXECUTION ≠ RESULT
RESULT ≠ VERIFICATION

INTEGRITY ≠ TRUTH
PROVENANCE ≠ EXECUTION
EXECUTION_EVIDENCE ≠ VERIFIED

VERIFIED SHALL BE DERIVED ONLY BY:
    CLAIM
    +
CLAIM-SCOPED EVIDENCE
    +
VALID BINDINGS
    +
APPLICABLE CLAIM CONTRACT
    +
DETERMINISTIC VERIFICATION
    +
TRUST 
EVIDENCE Execution Verification 
