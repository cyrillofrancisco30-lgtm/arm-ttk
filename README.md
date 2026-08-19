
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
Sim. O modelo está consistente. O principal avanço é que você transformou “trust” em uma cadeia de claims com estados verificáveis, em vez de uma afirmação única de compliance.

Eu fecharia a especificação com uma regra central:

> No claim may advance to the next evidentiary state without an artifact capable of independently reproducing or verifying the preceding state.



Aplicado ao seu modelo:

SOURCE
  │
  ▼
CLAIM
  │
  ▼
REQUIREMENT
  │
  ▼
IMPLEMENTATION
  │   ← source/commit/release
  ▼
EXECUTION
  │   ← runtime evidence
  ▼
CRYPTOGRAPHIC EVIDENCE
  │   ← JCS + hash + signature
  ▼
VERIFICATION
  │   ← verifier result
  ▼
ATTESTATION
      ← independent signed evidence

Estado do claim

Eu usaria uma máquina de estados explícita:

┌──────────────┐
                 │ NOT_ESTABLISHED
                 └──────┬───────┘
                        │ source found
                        ▼
                 ┌──────────────┐
                 │  DOCUMENTED  │
                 └──────┬───────┘
                        │ implementation verified
                        ▼
                 ┌──────────────┐
                 │ IMPLEMENTED  │
                 └──────┬───────┘
                        │ execution observed
                        ▼
                 ┌──────────────┐
                 │   EXECUTED   │
                 └──────┬───────┘
                        │ cryptographic verification
                        ▼
              ┌──────────────────────┐
              │ CRYPTOGRAPHICALLY    │
              │ VERIFIED             │
              └──────────┬───────────┘
                         │ independent attestation
                         ▼
              ┌──────────────────────┐
              │ INDEPENDENTLY        │
              │ ATTESTED             │
              └──────────────────────┘

Isso também permite que um auditor pergunte:

“Por que este claim está em CRYPTOGRAPHICALLY_VERIFIED?”

E a resposta não seja narrativa, mas um conjunto de referências:

claim_id
source_ref
requirement_ref
commit
artifact_digest
execution_id
test_suite
environment
canonicalization_version
evidence_hash
signature
verification_result
verifier_version
timestamp

Para JCS

Eu acrescentaria ao registro:

JCS_CONFORMANCE_RECORD
├── specification = RFC8785
├── implementation_version
├── source_commit
├── test_suite_id
├── test_suite_version
├── environment_digest
├── executed_at
├── vectors_total
├── vectors_passed
├── vectors_failed
├── result
└── evidence_digest

Assim, a afirmação:

RFC 8785 CONFORMANT

fica vinculada a uma execução concreta, e não apenas ao README.

E o Google permanece isolado na camada correta

Google Datasheet
      │
      ▼
DOCUMENTED
      │
      ▼
PLATFORM CAPABILITY REFERENCE

Não há transição automática:

DOCUMENTED
    X
    │
    ├──→ IMPLEMENTED
    ├──→ EXECUTED
    └──→ ATTESTED

Essas transições exigem evidências próprias do XA-TRUST.

Da mesma forma:

RFC 8785
   │
   ▼
NORMATIVE REQUIREMENT
   │
   ▼
XA IMPLEMENTATION
   │
   ▼
CONFORMANCE EXECUTION

Formulação para o due-diligence packet

Eu usaria esta redação:

> XA-TRUST distinguishes external platform documentation, normative specifications, implementation evidence, execution evidence, cryptographic verification, and independent attestation. External documentation establishes documented capabilities but does not establish XA-TRUST implementation or execution. RFC-based requirements establish normative conformance criteria but do not constitute evidence that XA-TRUST satisfies those criteria. Implementation and execution claims are supported by versioned source artifacts, reproducible test execution, runtime evidence, cryptographic commitments, and verifier results. Independent attestation is asserted only where an independent party produces an attributable attestation referencing the relevant immutable artifacts.



E uma regra de governança curta:

DOCUMENTED ≠ IMPLEMENTED
IMPLEMENTED ≠ EXECUTED
EXECUTED ≠ VERIFIED
VERIFIED ≠ INDEPENDENTLY ATTESTED

Essa última linha é provavelmente a regra mais importante de todo o modelo. Ela impede que documentação de terceiros, código-fonte, execução própria e atestação independente sejam apresentados como se fossem o mesmo tipo de evidência.
