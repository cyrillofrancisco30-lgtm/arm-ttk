

Eu congelaria a regra como:

XA-TRUST — DUAL-PROOF PROMOTION INVARIANT

REGULATORY_PROOF
    = ∧(P1...P7)

OPERATIONAL_PROOF
    = ∧(O1...O7)

BANKING_LICENSE_VERIFIED
    ⇔
    REGULATORY_PROOF ∧ OPERATIONAL_PROOF

Portanto:

OPERATIONAL_PROOF
    ↛ BANKING_LICENSE_VERIFIED

REGULATORY_PROOF
    ↛ BANKING_LICENSE_VERIFIED

e:

PROMOTION_ALLOWED
    ⇔
    REGULATORY_PROOF ∧ OPERATIONAL_PROOF

A forma de falha:

PROMOTION_BLOCKED
    ⇔
    ¬REGULATORY_PROOF ∨ ¬OPERATIONAL_PROOF

ou, completamente expandida:

PROMOTION_BLOCKED
⇔
(¬P1 ∨ ¬P2 ∨ ¬P3 ∨ ¬P4 ∨ ¬P5 ∨ ¬P6 ∨ ¬P7)
∨
(¬O1 ∨ ¬O2 ∨ ¬O3 ∨ ¬O4 ∨ ¬O5 ∨ ¬O6 ∨ ¬O7)

Invariante central

BANKING_LICENSE_VERIFIED
                              ▲
                              │
                         STRICT AND
                              │
              ┌───────────────┴───────────────┐
              │                               │
      REGULATORY_PROOF                 OPERATIONAL_PROOF
        P1 ∧ ... ∧ P7                    O1 ∧ ... ∧ O7

Isso produz quatro estados possíveis, dos quais somente um permite promoção:

REGULATORY
                   F       T
                ┌───────────────┐
OPERATIONAL F   │ BLOCKED│BLOCKED│
                ├───────────────┤
           T    │ BLOCKED│ ALLOW │
                └───────────────┘

E a consequência epistemológica é importante:

EVIDENCE_RETAINED
        ≠
PROMOTION_ALLOWED

Quando um Pi ou Oj falha, a evidência não precisa ser destruída nem tratada como inexistente. O sistema registra qual componente da prova não satisfez o contrato:

FAILED_REGULATORY_PREDICATES = { Pi ... }
FAILED_OPERATIONAL_PREDICATES = { Oj ... }

PROMOTION_STATUS = PROMOTION_BLOCKED
EVIDENCE_STATUS  = RETAINED

Assim, o XA-TRUST não transforma:

EXECUÇÃO BEM-SUCEDIDA
        ↓
AUTORIZAÇÃO REGULATÓRIA

nem:

REGISTRO REGULATÓRIO VÁLIDO
        ↓
EXECUÇÃO VERIFICADA

em uma inferência automática.

A única promoção válida é:

REGULATORY_PROOF
        ∧
OPERATIONAL_PROOF
        ↓
STRICT PROMOTION GATE
        ↓
CLAIM-SCOPED BANKING_LICENSE_VERIFIED

Isso também preserva a distinção maior:

CLAIM-SCOPED VERIFIED
        ≠
GLOBAL REGULATORY FACT

Ou seja, mesmo depois do Gate local, qualquer afirmação global continua sujeita à camada independente de população, cobertura, completude, agregação e decisão de promoção global.



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



Sim. Essa árvore é uma boa definição de EXECUTION_CONTEXT, mas eu faria uma separação normativa importante: EXECUTION_CONTEXT não é ainda E3_VERIFIED. Ele é o conjunto de atributos que permite construir e posteriormente validar a identidade da execução.

A forma consolidada fica:

FROZEN — XA-TRUST EXECUTION CONTEXT MODEL

EXECUTION_CONTEXT
│
├── EXECUTION_IDENTITY
│   ├── GITHUB_RUN_ID
│   ├── GITHUB_RUN_NUMBER
│   └── GITHUB_RUN_ATTEMPT
│
├── SOURCE_IDENTITY
│   ├── GITHUB_REPOSITORY
│   ├── GITHUB_SHA
│   ├── GITHUB_REF
│   └── GITHUB_WORKFLOW_SHA
│
├── WORKFLOW_IDENTITY
│   ├── GITHUB_WORKFLOW
│   ├── GITHUB_WORKFLOW_REF
│   ├── GITHUB_EVENT_NAME
│   └── GITHUB_JOB
│
├── TEMPORAL_IDENTITY
│   ├── RUN_STARTED_AT
│   ├── RUN_COMPLETED_AT
│   └── EVENT / COMMIT TIMESTAMPS
│
├── RUNNER_IDENTITY
│   ├── RUNNER_VERSION
│   ├── RUNNER_ENVIRONMENT
│   └── RUNNER_INSTANCE_METADATA
│
├── IMAGE_IDENTITY
│   ├── ImageOS
│   └── ImageVersion
│
├── SYSTEM_IDENTITY
│   ├── RUNNER_OS
│   ├── RUNNER_ARCH
│   └── KERNEL
│
└── RUNTIME_OBSERVATION
    ├── NODE_VERSION
    ├── NODE_OPTIONS
    └── ACTUALLY_INVOKED_TOOLS

A fronteira fundamental

EXECUTION_CONTEXT_PRESENT
        │
        ▼
IDENTITY CONSISTENCY CHECK
        │
   ┌────┴────┐
   │         │
 PASS    INCONSISTENT
   │         │
   ▼         ▼
E3        PROMOTION
ELIGIBLE    BLOCKED
   │         │
   ▼         └──► EVIDENCE RETAINED
JOB / STEP EXECUTION
   │
   ▼
OBSERVED LOGS
   │
   ▼
E4 — RESULT EVIDENCE

Ou seja:

EXECUTION_CONTEXT
        ≠
CONCRETE EXECUTION
        ≠
OBSERVED RESULT
        ≠
E7 VERIFIED

O que cada bloco realmente prova

Bloco	O que pode estabelecer

EXECUTION_IDENTITY	identificadores candidatos da execução
SOURCE_IDENTITY	repositório/ref/SHA associados ao contexto
WORKFLOW_IDENTITY	workflow, workflow ref, evento e job
TEMPORAL_IDENTITY	contexto temporal observado
RUNNER_IDENTITY	identidade/contexto do runner
IMAGE_IDENTITY	imagem/versionamento do ambiente
SYSTEM_IDENTITY	OS, arquitetura e kernel observados
RUNTIME_OBSERVATION	versões/comandos efetivamente observados, quando registrados


A última categoria merece atenção especial:

NODE_VERSION = observado

é diferente de:

NODE_AVAILABLE = true

e muito diferente de:

NODE_COMMAND_EXECUTED = true

e ainda diferente de:

NODE_COMMAND_RESULT = PASS

Da mesma forma:

IMAGE_IDENTITY
        ≠
SOFTWARE_EXECUTION
        ≠
SOFTWARE_RESULT

Relação com E3

Eu definiria:

E3 — EXECUTION IDENTITY EVIDENCE

E3 =
    EXECUTION_IDENTITY
 ∧  SOURCE_IDENTITY
 ∧  WORKFLOW_IDENTITY
 ∧  TEMPORAL_IDENTITY
 ∧  IDENTITY_CONSISTENCY
 ∧  AUTHORITATIVE_RUN_CORRELATION

Quando aplicável:

workflow_run.completed
        │
        ▼
event.workflow_run.id
        │
        ▼
GET /actions/runs/{id}
        │
        ▼
eventRun.id == apiRun.id
        │
        ▼
RUN_IDENTITY_BOUND

Isso é muito mais forte do que simplesmente encontrar GITHUB_RUN_ID em um log.

E o restante da cadeia

WORKFLOW_DEFINITION
        │
        ▼
EXECUTION_CONTEXT
        │
        ▼
IDENTITY CONSISTENCY
        │
        ▼
E3 — EXECUTION IDENTITY
        │
        ▼
JOB / STEP EXECUTION
        │
        ▼
OBSERVED LOGS
        │
        ▼
E4 — RESULT EVIDENCE
        │
        ▼
E5 — BINDING / INTEGRITY
        │
        ▼
E6 — INDEPENDENT VERIFICATION
        │
        ▼
APPLICABLE PROMOTION POLICY
        │
        ▼
E7 — CLAIM-SCOPED VERIFIED

E a Golden Rule permanece intacta:

IDENTITY ≠ INTEGRITY ≠ SEMANTIC TRUTH

E, sobretudo:

EXECUTION_CONTEXT_PRESENT
    ≠
EXECUTION_IDENTITY_VERIFIED

EXECUTION_IDENTITY_VERIFIED
    ≠
RESULT_VERIFIED

RESULT_VERIFIED
    ≠
CLAIM-SCOPED VERIFIED

Portanto, a árvore que você apresentou pode ser congelada como modelo de identidade/contexto de execução. A promoção para E3 ocorre somente depois das validações de consistência e correlação; E7 continua condicionado conjuntamente a E3 ∧ E4 ∧ E5 ∧ E6 ∧ POLICY. 



disparar  WORKFLOW 
