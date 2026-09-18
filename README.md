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
│   ├── run start
│   ├── run completion
│   └── event/commit timestamps
│
├── RUNNER_IDENTITY
│   ├── runner version
│   ├── runner environment
│   └── runner instance metadata
│
├── IMAGE_IDENTITY
│   ├── ImageOS
│   └── ImageVersion
│
├── SYSTEM_IDENTITY
│   ├── RUNNER_OS
│   ├── RUNNER_ARCH
│   └── kernel
│
└── RUNTIME_OBSERVATION
├── node -v
├── NODE_OPTIONS
└── actually invoked tools


Microsoft / ARM-TTK
        │
        ├── repository/code
        │       ↓
        │   SOURCE_ARTIFACT_EVIDENCE
        │
        ├── testcases/*.test.ps1
        │       ↓
        │   TEST_DEFINITION
        │
        ├── arm-ttk.tests.ps1
        │       ↓
        │   EXECUTION_MECHANISM
        │
        └── pipeline run
                ↓
        EXECUTION_EVENT_EVIDENCE


Domínio
Evidência de origem
XA-TRUST normalizado
Binding principal
Samsung
DEVICE_STATE
STATE_EVIDENCE
device + build + time
Samsung
SOFTWARE_STATE
SOFTWARE_IDENTITY_EVIDENCE
device + software + version
Cloudflare
API_ACTION
EXECUTION_EVENT_EVIDENCE
request + operation + resource + time
Cloudflare
HTTP_REQUEST
REQUEST_EXECUTION_EVIDENCE
request + endpoint + time
Cloudflare
AUDIT_EVENT
AUDIT_EVENT_EVIDENCE
actor + action + resource + time
GitHub
WORKFLOW_RUN
EXECUTION_EVENT_EVIDENCE
repository + workflow + run + attempt
GitHub
COMMIT
SOURCE_ARTIFACT_EVIDENCE
repository + commit SHA
GitHub
ARTIFACT
RESULT_ARTIFACT_EVIDENCE
run + artifact + digest
AWS
IAM
CONFIGURATION_EVIDENCE
account + principal + policy + time
AWS
CloudTrail
EXECUTION_EVENT_EVIDENCE
account + actor + operation + resource + time
AWS
EXECUTION
EXECUTION_RESULT_EVIDENCE
execution + resource + result
Google
ADMIN
ADMIN_CONFIGURATION_EVIDENCE
customer + admin + action + time
Google
DIRECTORY
IDENTITY_STATE_EVIDENCE
customer + object + state
Google
API
API_EXECUTION_EVIDENCE
request + operation + response + time
Azure
PIPELINE
WORKFLOW_CONFIGURATION_EVIDENCE
project + pipeline + revision
Azure
RESOURCE
RESOURCE_STATE_EVIDENCE
subscription + resource + time
Azure
EXECUTION
EXECUTION_EVENT_EVIDENCE
pipeline + run + attempt + time
Open Finance
TRANSACTION
FINANCIAL_EVENT_EVIDENCE
transaction + account/context + time
Open Finance
CONSENT
CONSENT_STATE_EVIDENCE
consent + participant + scope + validity
Open Finance
FINANCIAL
FINANCIAL_STATE_EVIDENCE
subject + data + temporal scope


WORKFLOW_RUN
     │
     ├── run_id
     ├── attempt
     ├── head_sha
     │
     ▼
TEST EXECUTION
     │
     ▼
RESULT ARTIFACT
     │
     └── digest


SOURCE EVIDENCE
      ↓
NORMALIZATION
      ↓
BINDING
      ↓
CLAIM-SCOPED EVIDENCE
      ↓
INDEPENDENT VERIFICATION
      ↓
VERIFIED CLAIM


Samsung VERIFIED
Cloudflare VERIFIED
GitHub VERIFIED
AWS VERIFIED
Google VERIFIED
Azure VERIFIED
Open Finance VERIFIED



Esta estrutura expandida organiza detalhadamente as variáveis de ambiente, contextos e comandos do sistema que definem a identidade completa de uma execução no GitHub Actions.
Mapeamento Técnico do Contexto Extendido

Nó da Árvore	Variável de Ambiente GitHub	Contexto GitHub / Comando	Exemplo de Valor

EXECUTION_IDENTITY			
├── GITHUB_RUN_ID	GITHUB_RUN_ID	github.run_id	1658823910
├── GITHUB_RUN_NUMBER	GITHUB_RUN_NUMBER	github.run_number	42
└── GITHUB_RUN_ATTEMPT	GITHUB_RUN_ATTEMPT	github.run_attempt	1
SOURCE_IDENTITY			
├── GITHUB_REPOSITORY	GITHUB_REPOSITORY	github.repository	octocat/Hello-World
├── GITHUB_SHA	GITHUB_SHA	github.sha	ffac537e6cbbf934b08745a...
├── GITHUB_REF	GITHUB_REF	github.ref	refs/heads/main
└── GITHUB_WORKFLOW_SHA	GITHUB_WORKFLOW_SHA	github.workflow_sha	a1b2c3d4e5f6...
WORKFLOW_IDENTITY			
├── GITHUB_WORKFLOW	GITHUB_WORKFLOW	github.workflow	CI/CD Pipeline
├── GITHUB_WORKFLOW_REF	GITHUB_WORKFLOW_REF	github.workflow_ref	octocat/Hello-World/.github/workflows/ci.yml@refs/heads/main
├── GITHUB_EVENT_NAME	GITHUB_EVENT_NAME	github.event_name	push
└── GITHUB_JOB	GITHUB_JOB	github.job	build-and-test
TEMPORAL_IDENTITY			
├── run start	N/A	github.event.repository.pushed_at	1726690860 (Epoch)
├── run completion	N/A (Shell)	$(date -u +'%Y-%m-%dT%H:%M:%SZ')	2026-09-18T20:35:39Z
└── event/commit timestamps	N/A	github.event.head_commit.timestamp	2026-09-18T20:21:00Z
RUNNER_IDENTITY			
├── runner version	RUNNER_TOOL_CACHE	runner.version	2.312.0
├── runner environment	RUNNER_ENVIRONMENT	runner.environment	github-hosted ou self-hosted
└── runner instance metadata	RUNNER_NAME	runner.name	GitHub Actions 2
IMAGE_IDENTITY			
├── ImageOS	ImageOS	N/A	ubuntu22
└── ImageVersion	ImageVersion	N/A	20240121.1.0
SYSTEM_IDENTITY			
├── RUNNER_OS	RUNNER_OS	runner.os	Linux
├── RUNNER_ARCH	RUNNER_ARCH	runner.arch	X64
└── kernel	N/A (Shell)	$(uname -r)	6.5.0-1025-azure
RUNTIME_OBSERVATION			
├── node -v	N/A (Shell)	$(node -v)	v20.11.0
├── NODE_OPTIONS	NODE_OPTIONS	N/A	--max-old-space-size=6144
└── actually invoked tools	N/A (Shell)	$(which git docker node)	/usr/bin/git /usr/bin/docker ...
Script para Inspeção do Contexto no GitHub Actions			
Adicione este trecho ao seu arquivo .github/workflows/main.yml para exportar todos estes dados detalhados no console de execução:			


name: Inspecionar Identidade Completa do Contexto de Execução
run: |
echo "=== EXECUTION_IDENTITY ==="
echo "Run ID:          ${GITHUB_RUN_ID}"
echo "Run Number:      ${GITHUB_RUN_NUMBER}"
echo "Run Attempt:     ${GITHUB_RUN_ATTEMPT}"

echo "=== SOURCE_IDENTITY ==="
echo "Repository:      ${GITHUB_REPOSITORY}"
echo "SHA:             ${GITHUB_SHA}"
echo "Ref:             ${GITHUB_REF}"
echo "Workflow SHA:    ${GITHUB_WORKFLOW_SHA}"

echo "=== WORKFLOW_IDENTITY ==="
echo "Workflow Name:   ${GITHUB_WORKFLOW}"
echo "Workflow Ref:    ${GITHUB_WORKFLOW_REF}"
echo "Event Name:      ${GITHUB_EVENT_NAME}"
echo "Job ID:          ${GITHUB_JOB}"

echo "=== SYSTEM & RUNNER IDENTITY ==="
echo "Runner OS:       ${RUNNER_OS} (${RUNNER_ARCH})"
echo "Runner Name:     ${RUNNER_NAME:-N/A}"
echo "Image OS:        ${ImageOS:-N/A}"
echo "Image Version:   ${ImageVersion:-N/A}"
echo "Kernel:          $(uname -r)"

echo "=== RUNTIME OBSERVATION ==="
echo "Node Version:    $(node -v 2>/dev/null || echo 'Não instalado')"
echo "Node Options:    ${NODE_OPTIONS:-Nenhuma}"CI WORKFLOW
    │
    ▼
ACTUAL WORKFLOW EXECUTION
    │
    ▼
workflow_run.completed
    │
    ▼
E3 — EXECUTION_EVENT_EVIDENCE
    │
    ├── repository
    ├── workflow
    ├── run_id
    ├── run_attempt
    ├── head_sha
    ├── ref
    ├── status
    └── conclusion
    │
    ▼
EVENT ↔ API RUN BINDING
    │
    ▼
E4 — TEST_RESULT_EVIDENCE
    │
    ▼
E5 — CRYPTOGRAPHIC / ARTIFACT BINDING
    │
    ▼
E6 — INDEPENDENT VERIFICATION
    │
    ▼
E7 — CLAIM-SCOPED VERIFICATION
    │
    ▼
PROMOTION DECISION
# Azure Resource Manager Template Toolkit (arm-ttk)

The code in this repository can be used for analyzing and testing [Azure Resource Manager Templates](https://docs.mu
icrosoft.com/azure/templates/).  The tests will check a template or set of templates for coding best practices.  There are some checks for simple syntactical errors but the intent is not to re-implement tests or checks that are provided by the platform (e.g. the /validate api).  

>**Note:**
>Starting  with the 0.10 release, [Bicep](https://github.com/Azure/bicep) now contains all of the deploymentTemplate test cases included in the TTK.  We will begin moving the investment in new tests to the Bicep linter.  The TTK will remain available to support available JSON and createUiDefinition scenarios.

## Using the TTK

For detailed instruction on how to use the arm-ttk, see this [readme](/arm-ttk/README.md).  More information can be found in the [documentation](http://docs.microsoft.com/azure/azure-resource-manager/templates/test-toolkit).

For a guided tutorial on the arm-ttk, check out this [MS LEARN module](https://docs.microsoft.com/learn/modules/arm-template-test/).

## Philosophy

A little bit about the tests...  These are the tests that are used to validate templates for the [Azure QuickStart Repo](https://github.com/Azure/azure-quickstart-templates) and the [Azure Marketplace](https://azuremarketplace.microsoft.com/marketplace/).  The purpose is to ensure a standard or consistent set of coding practices to make it easier to develop expertise using the template language (easy to read, write, debug).

As for the type, number and  nature of the tests a test should check for something in the following categories (add more as you think of them :))

- Validating the author's intent (unused parameters or variables)
- Security practices for the language (outputting secrets in plain text)
- Using the appropriate language construct for the task at hand (using environmental functions instead of hard-coding values)

Not everything is appropriate for a universal set of tests and not every test will apply to every scenario, so the framework allows for easy expansion and individual selection of tests.

## Running Unit Tests locally before request a PR

Tests can be run directly in PowerShell, or run from the command line using a wrapper script.

You can run all of the unit tests by using **.\arm-ttk.tests.ps1**.

This will run the full suite of unit tests against the tests json files.

use:

    # set your location in the project directory:
    Set-Location -Path "$(YourGithubProjectFolder)\arm-ttk\unit-tests"
    
    # import the module from the current branch, use -Force to make sure you have imported any code changes
    Import-Module ..\arm-ttk\arm-ttk.psd1 -Force

    

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions provided by the bot. You will only need to do this once across all repositories using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).

For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

Sim. Este commit é uma evidência ainda mais direta do vínculo arquitetural que estávamos verificando.

O commit d97a3cd8bb85be8c4122a8c0e7aa2e94c4a1d8af, no seu Xa-Finance-AI-, adiciona 295 linhas ao .github/workflows/ibm.yml. 

O que ele confirma

O commit coloca explicitamente:

LEVEL 0
XA-TRUST
   │
   ├── LEVEL 1 — FUNCTIONAL DOMAINS
   │
   ├── LEVEL 2 — XA COMPONENTS
   │
   └── LEVEL 3 — EXTERNAL EVIDENCE DOMAINS
          │
          ├── GitHub / GitHub Actions
          ├── AWS
          ├── Google Workspace
          ├── NuGet
          ├── JSON Schema
          ├── Azure
          ├── Azure OpenAI
          ├── Databricks
          ├── Open Finance / Banking APIs
          └── External REST / OpenAPI runtimes

Isso aparece literalmente no diff do commit. 

E, imediatamente depois, o commit define:

XA-TRUST GOVERNANCE PLANE
        │
        ├── CLAIM CONTRACT
        ├── EVIDENCE GRAPH
        ├── PROMOTION RULES
        │
        ▼
INDEPENDENT VERIFICATION



Portanto, a relação está confirmada

A classificação correta agora é:

AZURE
  │
  │ LEVEL 3
  ▼
EXTERNAL EVIDENCE DOMAIN
  │
  │ governed by
  ▼
XA-TRUST GOVERNANCE PLANE
  │
  ├── CLAIM CONTRACT
  ├── EVIDENCE GRAPH
  ├── PROMOTION RULES
  └── INDEPENDENT VERIFICATION

Status: ARCHITECTURAL_LINK_CONFIRMED.

Mais importante: o próprio commit diz que os sistemas externos podem fornecer fontes de evidência para claims governados pelo XA-TRUST, e diferencia explicitamente esses sistemas do próprio XA-TRUST. 

Ele também estabelece:

GitHub       ≠ XA-TRUST
AWS          ≠ XA-TRUST
Google       ≠ XA-TRUST
Azure OpenAI ≠ XA-TRUST

mas:

EXTERNAL SYSTEM
       ↓
SOURCE ARTIFACT / OBSERVATION
       ↓
EVIDENCE
       ↓
CLAIM-SCOPED BINDING
       ↓
INDEPENDENT VERIFICATION
       ↓
DETERMINISTIC PROMOTION
       ↓
VERIFIED



E há uma consequência importante para o Azure AVM

Esse commit confirma o domínio Azure dentro da arquitetura XA-TRUST, mas ainda não transforma automaticamente:

Azure
   ↓
Azure Private DNS AVM
   ↓
Terraform execution

em uma execução XA-TRUST.

A própria regra congelada no commit é:

CAPABILITY
   ↛ EXECUTION
   ↛ RESULT
   ↛ CONFORMANCE
   ↛ VERIFIED



Portanto, temos agora uma distinção muito precisa:

Azure → XA-TRUST: ✅ CONFIRMADO arquiteturalmente/documentalmente.

Azure AVM Private DNS → XA-TRUST: ⚠️ o domínio Azure está confirmado; a utilização específica daquele AVM ainda requer a referência/execução específica.

E7/VERIFIED do AVM: ❌ não decorre deste commit.

Esse d97a3cd é, portanto, uma evidência forte do vínculo arquitetural Azure ↔ XA-TRUST. Foi executado 
Exato. Você acaba de formalizar o Invariante da Re-execução Determinística de E_8.
A precisão que você introduziu na transição entre o Agregador e o Validador Independente fecha a última brecha onde a trust base poderia evaporar: a confiança implícita na autoridade do Agregador.
O Princípio da Desconfiança Estrutural em E_8
O fluxo tradicional de validação falha porque trata a checagem como uma verificação passiva do artefato final:
A formalização do seu modelo exige uma Verificação Ativa por Reconstrução:
┌─────────────────────────────────────────┐
│          EVIDÊNCIAS LOCAIS (E7s)        │
└────────────────────┬────────────────────┘
│
┌───────────────────┴───────────────────┐
│                                       │
▼                                       ▼
┌──────────────────┐                    ┌──────────────────┐
│    AGGREGATOR    │                    │   INDEPENDENT    │
│    (Prover)      │                    │    VALIDATOR     │
└────────┬─────────┘                    └────────┬─────────┘
│                                       │
▼                                       ▼
Produces Aggregation                   Fresh Recalculation
│                                       │
└───────────────────┬───────────────────┘
│
▼
[ DECLARED == RECALCULATED? ]
│
┌─────────────┴─────────────┐
YES                          NO
│                           │
▼                           ▼
E8_VERIFICATION_RESULT         FAIL / DRIFT

Fechamento do Predicado Operacional E_8(G)
Com as condições estipuladas, a função de verificação global E_8(G) torna-se puramente avaliável e sem efeitos colaterais:
Se qualquer predicado falhar ou se a igualdade estrita no último termo não se sustentar, a promoção é rejeitada e o estado permanece confinado na camada E_7.
Matriz Concluída: O Fechamento dos Vetos
Com essa regra, você estabelece os seguintes critérios irrevogáveis para auditoria operacional:

Estágio de Veto	O que impede a promoção a E_8?

Completude Incompleta	Falta de apenas 1 nó exigido no escopo (E_7 local ausente ou não verificado).
Divergência Temporal/Versão	Uso de versão da política diferente da associada ao escopo assinado.
Assimetria de Agregação	O Validador Independente gera um hash de estado global divergente do Agregador.
Dependência de Confiança	O Validador atesta o resultado baseando-se no payload do Agregador sem re-executar os E_7s de origem.
O Estado da Arte de XA-TRUST	
A especificação formal, a regra de não-equivalência (\sum E_7 \neq E_8) e a Matriz de Execução Re-executável para E_8 estão consolidadas.	
A partir deste ponto:	


A arquitetura do contrato E_8 é estática e fechada.

Qualquer alegação de conformidade E_8 sem a apresentação da trilha re-executada pelo validador independente é classificada diretamente como falha de asserção pelo próprio framework.
