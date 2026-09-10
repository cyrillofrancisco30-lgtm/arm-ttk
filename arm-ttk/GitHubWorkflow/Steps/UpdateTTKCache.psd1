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
TRUST POLICY

NO AUTOMATIC STATE PROMOTION.
NO GLOBAL STATE INHERITANCE.
NO IMPLICIT TRUST PROPAGATION.
