
XA-FINANCE-AI/
│
├── .github/
│   └── workflows/
│       ├── dod-zt-structural-validation.yml
│       ├── dod-zt-python-tests.yml
│       └── dod-zt-opa-tests.yml
│
├── docs/
│   └── compliance/
│       ├── XA-TRUST-DOD-ZT-CROSSWALK-001.md
│       ├── XA-TRUST-DOD-ZT-CROSSWALK-001.csv
│       ├── capability-acceptance-criteria.md
│       ├── evidence-model.md
│       └── implementation-limitations.md
│
├── policies/
│   └── dod-zero-trust/
│       ├── user/
│       │   ├── 1.1-user-inventory.rego
│       │   ├── 1.2-conditional-access.rego
│       │   └── ...
│       ├── device/
│       │   └── ...
│       ├── application-workload/
│       │   └── ...
│       ├── data/
│       │   └── ...
│       ├── network-environment/
│       │   └── ...
│       ├── automation-orchestration/
│       │   └── ...
│       └── visibility-analytics/
│           └── ...
│
├── schemas/
│   └── evidence/
│       ├── execution.schema.json
│       ├── provenance.schema.json
│       ├── cryptographic-binding.schema.json
│       ├── independent-verification.schema.json
│       └── claim-promotion.schema.json
│
├── verifier/
│   └── dod-zero-trust/
│       ├── __init__.py
│       ├── crosswalk.py
│       ├── registry.py
│       ├── evidence.py
│       ├── promotion.py
│       └── checks/
│           ├── __init__.py
│           ├── user.py
│           ├── device.py
│           ├── application.py
│           ├── data.py
│           ├── network.py
│           ├── automation.py
│           └── visibility.py
│
├── tests/
│   └── dod-zero-trust/
│       ├── test_crosswalk_consistency.py
│       ├── test_registry_consistency.py
│       ├── test_evidence_schemas.py
│       ├── test_promotion_gates.py
│       ├── test_1_user.py
│       ├── test_2_device.py
│       ├── test_3_application.py
│       ├── test_4_data.py
│       ├── test_5_network.py
│       ├── test_6_automation.py
│       └── test_7_visibility.py
│
├── examples/
│   └── dod-zero-trust/
│       ├── execution.example.json
│       ├── provenance.example.json
│       └── verification.example.json
│
├── requirements-dev.txt
├── .gitignore
└── README.md

capability_id,pillar,pillar_name,capability_name,type,component_xa_trust,control_tecnico,artefato_evidencia,metodo_verificacao_independente,estado,lacuna_criterio_aceitacao



NOT_ASSESSED


Os schemas devem ter responsabilidades separadas.
Etapa Arquivo Responsabilidade
E3 execution.schema.json Identidade e contexto da execução
E4 provenance.schema.json Origem, coleta e proveniência
E5 cryptographic-binding.schema.json Hash, canonicalização e assinatura
E6 independent-verification.schema.json Verificação independente
E7 claim-promotion.schema.json 


E3 — EXECUTION
       |
       v
E4 — PROVENANCE
       |
       v
E5 — CRYPTOGRAPHIC BINDING
       |
       v
E6 — INDEPENDENT VERIFICATION
       |
       v
POLICY + ACCEPTANCE CRITERIA
       |
       v
E7 — VERIFIED(CLAIM-X)



CAPABILITY_REGISTRY = {
    "1.1": {
        "pillar": "user",
        "module": "user",
        "function": "check_1_1",
        "policy": "policies/dod-zero-trust/user/1.1-user-inventory.rego",
    },
    "1.2": {
        "pillar": "user",
        "module": "user",
        "function": "check_1_2",
        "policy": "policies/dod-zero-trust/user/1.2-conditional-access.rego",
    },
}


from pathlib import Path
import csv

ROOT = Path(__file__).resolve().parents[2]

DOC = ROOT / "docs/compliance/XA-TRUST-DOD-ZT-CROSSWALK-001.md"
CSV_FILE = ROOT / "docs/compliance/XA-TRUST-DOD-ZT-CROSSWALK-001.csv"


def load_csv():
    with CSV_FILE.open(
        encoding="utf-8-sig",
        newline=""
    ) as file:
        return list(csv.DictReader(file))


def test_no_false_conformance():
    document = DOC.read_text(encoding="utf-8")

    assert "NOT_CLAIMED" in document
    assert "NOT_ESTABLISHED" in document


def test_45_capabilities():
    rows = load_csv()

    assert len(rows) == 45

    ids = [row["capability_id"].strip() for row in rows]

    assert len(set(ids)) == 45
    assert all(ids)


def test_all_capabilities_initially_not_assessed():
    rows = load_csv()

    assert all(
        row["estado"] == "NOT_ASSESSED"
        for row in rows
    )

github/workflows/dod-zt-structural-validation.yml



name: XA-TRUST DoD ZT Structural Validation

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]
  workflow_dispatch:

permissions:
  contents: read

jobs:
  structural-validation:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.12"

      - name: Install dependencies
        run: pip install pytest jsonschema

      - name: Validate crosswalk
        run: |
          pytest tests/dod-zero-trust/test_crosswalk_consistency.py
          pytest tests/dod-zero-trust/test_registry_consistency.py


def test_no_false_conformance():
    # Garante que nenhum arquivo afirma conformidade DoD
    assert "NOT_CLAIMED" in open("docs/compliance/XA-TRUST-DOD-ZT-CROSSWALK-001.md").read()
    assert "NOT_ESTABLISHED" in open("docs/compliance/XA-TRUST-DOD-ZT-CROSSWALK-001.md").read()

def test_45_capabilities():
    assert len(load_csv()) == 45




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
