Este terceiro bloco permite refinar ainda mais a classificação. Ele é essencialmente o manifesto técnico da imagem de runner ubuntu-24.04 que aparece no log da execução.

A relação entre os dois artefatos é forte:

RUN LOG
Image: ubuntu-24.04
Version: 20260720.247.2
        │
        │ corresponde a
        ▼
RUNNER IMAGE MANIFEST
Ubuntu 24.04
Version: 20260720.247.2
        │
        ▼
AMBIENTE DISPONÍVEL NO RUNNER

O que isso demonstra

O manifesto fornece uma identidade detalhada do ambiente:

IMAGE_IDENTITY
├── ubuntu-24.04
├── OS 24.04.4 LTS
├── kernel 6.17.0-1020-azure
├── image 20260720.247.2
└── systemd 255.4-1ubuntu8.16

E também fornece o inventário de software disponível:

Python 3.12.3
Node.js 22.23.1
Docker 28.0.4
Git 2.54.0
Kubectl 1.36.2
Terraform [se presente no manifesto completo]
AWS CLI 2.36.2
Azure CLI 2.88.0
GitHub CLI 2.96.0
...

Portanto, podemos afirmar:

> O runner utilizado naquele contexto de execução foi associado à imagem ubuntu-24.04, versão 20260720.247.2, cujo manifesto documenta o ambiente e o software disponibilizado pela imagem.



Isso é uma evidência muito melhor do que simplesmente dizer “GitHub possui Ubuntu runners”.


---

Mas existe uma fronteira crítica

Por exemplo, o manifesto diz:

Docker Client 28.0.4
Docker Server 28.0.4

Isso significa:

DOCKER_AVAILABLE_IN_RUNNER = TRUE

Não significa:

DOCKER_EXECUTED = TRUE

Da mesma forma:

AWS CLI 2.36.2

não significa que:

aws command

foi executado.

E:

Python 3.12.3

não significa que:

python build_dep.py

foi executado.

A separação fica:

IMAGE_MANIFEST
      │
      └── SOFTWARE_AVAILABLE
               │
               X
               │
               ▼
       SOFTWARE_EXECUTED
               │
               ▼
          COMMAND_RESULT
               │
               ▼
        VERIFIED RESULT


---

Isso é particularmente importante para o XA-TRUST

Você agora possui três camadas distintas de evidência:

E1 — definição

.github/workflows/...

WORKFLOW_DEFINITION

E3 — execução

Seu log:

2026-08-04T10:18:38...
Current runner version: 2.336.0
...
repository: cyrillofrancisco30-lgtm/Xa-Finance-AI-
GITHUB_SHA: 4dd79f...
...
Run actions/checkout@v4

EXECUTION_EVENT_EVIDENCE

Ambiente da execução

Manifesto:

ubuntu-24.04
20260720.247.2
24.04.4 LTS
6.17.0-1020-azure

EXECUTION_ENVIRONMENT_EVIDENCE

Isso permite representar:

CLAIM
 │
 ├── WORKFLOW_DEFINITION
 │
 ├── EXECUTION_EVENT
 │      ├── timestamp
 │      ├── repository
 │      ├── source_sha
 │      ├── job
 │      └── executed action
 │
 └── EXECUTION_ENVIRONMENT
        ├── runner
        ├── OS
        ├── kernel
        ├── image
        └── image version

E o detalhe mais forte

O log contém:

GITHUB_SHA = 4dd79f238a960aded7c15c65c960e1d7e0559941

enquanto o manifesto contém:

Image Version = 20260720.247.2

e o próprio log confirma:

Runner Image
Image: ubuntu-24.04
Version: 20260720.247.2

Então há uma correspondência observável entre o ambiente declarado pela imagem e o ambiente registrado no run.


---

O que ainda falta para RESULT

Para sair de:

EXECUTION_DEMONSTRATED

e entrar em:

RESULT_EVIDENCE

precisamos do restante do log, especialmente:

Run <comando>
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


E8 CONTRACT
        ✓ CONSOLIDADO

E8 NON-DERIVABILITY RULE
        ✓ CONSOLIDADO

E8 PROMOTION PREDICATE
        ✓ CONSOLIDADO

E8 RE-EXECUTION INVARIANT
        ✓ CONSOLIDADO

E8 VETO CONDITIONS
        ✓ CONSOLIDADAS

E8 OPERATIONAL EXECUTION
        NÃO DEMONSTRADA

E8 INDEPENDENT RE-EXECUTION
        NÃO DEMONSTRADA

E8_GLOBAL_VERIFIED
        NÃO PROMOVIDO

        
...
output
...
Process completed with exit code 0

e, para o claim completo de supply chain:

BUILD
    ↓
IMAGE DIGEST
    ↓
SBOM
    ↓
SLSA PROVENANCE
    ↓
COSIGN
    ↓
REKOR
    ↓
OPA
    ↓
DEP
    ↓
LEDGER
    ↓
INDEPENDENT VERIFICATION

Portanto, sim: este material consolida o ambiente real da execução. Ele não deve ser classificado como mera configuração. Mas também não deve ser promovido além do que efetivamente observa.

A fórmula correta continua sendo:

RUNNER IMAGE MANIFEST + RUN LOG → EXECUTION ENVIRONMENT EVIDENCE

e não:

RUNNER IMAGE MANIFEST → VERIFIED BUILD/SUPPLY-CHAIN CLAIM.
# Azure Resource Manager Template Toolkit (arm-ttk)

The code in this repository can be used for analyzing and testing [Azure Resource Manager Templates](https://docs.microsoft.com/azure/templates/).  The tests will check a template or set of templates for coding best practices.  There are some checks for simple syntactical errors but the intent is not to re-implement tests or checks that are provided by the platform (e.g. the /validate api).  

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

    # These are the same tests that run in the pipeline when doing a commit or a pull request (PR). 
    .\arm-ttk.tests.ps1

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions provided by the bot. You will only need to do this once across all repositories using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).

For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
