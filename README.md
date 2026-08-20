
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

[19/08, 16:08] Francisco: RFC / GCP POLICY DEFINITION
↓
REQUIREMENT
↓
GCP POLICY CONFIGURATION
↓
DRY-RUN OBSERVATION
↓
RAW GCP EVIDENCE
↓
JCS
↓
SHA-256
↓
SIGNATURE / PROVENANCE
↓
XA-TRUST VERIFIER
↓
PROMOTION
[19/08, 16:14] Francisco: {
"evidence_id": "E-GCP-POLICY-DRYRUN-EXEC-000001",
"evidence_type": "GCP_ORG_POLICY_DRYRUN_AUDIT_EVENT",

"derived_from": [
"E-GCP-ORG-POLICY-048-002"
],

"source": {
"provider": "Google Cloud",
"service": "Cloud Audit Logs"
},

"observation": {
"constraint": "compute.managed.restrictProtocolForwardingCreationForTypes",
"live_result": "ALLOWED",
"dry_run_result": "DENIED"
},

"execution_context": {
"timestamp": "<AUDIT_LOG_TIMESTAMP>",
"resource": "<RESOURCE_NAME>",
"method": "<METHOD_NAME>",
"insert_id": "<INSERT_ID>"
},

"claim": {
"claim_id": "C-GCP-POLICY-048-002-EXEC-001",
"claim_status": "OBSERVED_DRYRUN_VIOLATION"
},

"implementation_proof": "NOT_ESTABLISHED",
"execution_proof": "OBSERVED",
"cryptographic_proof": "NOT_ESTABLISHED",
"independent_attestation": "NOT_ESTABLISHED"
}

Sim. Com o material que você trouxe, eu transformaria isso agora em um pedido formal de orientação regulatória, mas faria uma correção estratégica importante: não pediria ao Banco Central que “reconheça” o XA TRUST como infraestrutura regulatória. Pediria que o BC determine qual é o enquadramento regulatório da tecnologia e quais requisitos passam a existir conforme o caso de uso.

Isso é especialmente importante porque o Sandbox do BC é destinado a projetos inovadores na área financeira ou de pagamentos que estejam dentro da competência regulatória do BC/CMN; a regulamentação também prevê orientação durante os testes. 

Pedido formal — versão que eu protocolaria

ASSUNTO

Solicitação de orientação quanto ao enquadramento regulatório do XA Trust Execution Verifier — XATEV como infraestrutura tecnológica de verificação, evidência criptográfica, replay determinístico e governança de execuções automatizadas

Requerente: XA Finance Tecnologia Ltda.
Solução: XA Trust Execution Verifier — XATEV
Domínio: Execution Trust / AI Governance / Cryptographic Evidence / Regulatory Compliance


---

1. OBJETO DO PEDIDO

A XA Finance Tecnologia Ltda. solicita ao Banco Central do Brasil orientação quanto ao enquadramento jurídico e regulatório aplicável ao XA Trust Execution Verifier — XATEV.

O XATEV é uma infraestrutura tecnológica destinada a produzir e verificar evidências sobre execuções automatizadas, incluindo execuções envolvendo sistemas de software, modelos de inteligência artificial, políticas automatizadas e processos de decisão.

Sua arquitetura contempla:

DECISION / EXECUTION EVENT
        ↓
TYPED EXECUTION MODEL
        ↓
IDENTITY / AUTHORIZATION
        ↓
POLICY / CONTRACT VALIDATION
        ↓
RUNTIME EXECUTION
        ↓
EXECUTION EVIDENCE
        ↓
CRYPTOGRAPHIC ATTESTATION
        ↓
DETERMINISTIC REPLAY
        ↓
INDEPENDENT VERIFICATION
        ↓
LEDGER / EVIDENCE BINDING
        ↓
COMPLIANCE MAPPING
        ↓
TRUST STATE
        ↓
REGULATORY EVIDENCE PACKAGE

A requerente não pretende atribuir ao XATEV função regulatória, certificadora ou decisória estatal.


---

2. NATUREZA DA TECNOLOGIA

O XATEV não é concebido como um modelo de IA isolado nem como uma aplicação financeira convencional.

Sua função é criar uma camada de confiança verificável sobre uma execução:

EXECUÇÃO
   ↓
EVIDÊNCIA
   ↓
INTEGRIDADE
   ↓
ASSINATURA
   ↓
REPLAY
   ↓
VERIFICAÇÃO INDEPENDENTE
   ↓
TRUST ASSERTION

A arquitetura estabelece que um estado de confiança somente pode ser produzido a partir de verificações efetivamente executadas.

Em termos formais:

TRUST_OK =
IDENTITY
∧ AUTHORIZATION
∧ INTEGRITY
∧ SIGNATURE
∧ REPLAY
∧ LEDGER
∧ COMPLIANCE

Portanto, um campo declaratório como verified: true não constitui, por si só, evidência suficiente para produzir TRUST_OK.


---

3. EXECUTION TRUST

O XATEV utiliza uma máquina de estados de verificação:

START
  ↓
SCHEMA_VALIDATION
  ↓
ORIGIN_VERIFICATION
  ↓
IDENTITY_VERIFICATION
  ↓
CONTRACT_VALIDATION
  ↓
RUNTIME_VERIFICATION
  ↓
DECISION_TRACE_VERIFICATION
  ↓
EVIDENCE_VERIFICATION
  ↓
CRYPTOGRAPHIC_VERIFICATION
  ↓
REPLAY_VERIFICATION
  ↓
LEDGER_VERIFICATION
  ↓
CERTIFICATION
  ↓
TRUST_OK

Cada etapa possui condição de falha correspondente.

Exemplo:

INVALID HASH
      ↓
TRUST_DENIED(CRYPTO_FAILURE)

INVALID SIGNATURE
      ↓
TRUST_DENIED(CRYPTO_FAILURE)

FAILED REPLAY
      ↓
TRUST_DENIED(REPLAY_FAILURE)

BROKEN LEDGER
      ↓
TRUST_DENIED(LEDGER_FAILURE)


---

4. EVIDÊNCIA DE EXECUÇÃO

O modelo de evidência pode registrar, conforme o caso:

{
  "execution_id": "...",
  "source_commit": "...",
  "model_version": "...",
  "policy_version": "...",
  "runtime": "...",
  "input_hash": "...",
  "execution_trace": "...",
  "output_hash": "...",
  "canonicalization": "RFC8785",
  "digest": "SHA-256",
  "signature": "...",
  "ledger_binding": "...",
  "replay_status": "...",
  "trust_state": "..."
}

O objetivo é possibilitar a verificação independente posterior.


---

5. DISTINÇÃO ENTRE INSTRUÇÃO E EXECUÇÃO

A requerente também estabelece uma distinção fundamental entre:

DECLARATION

e

EXECUTION EVIDENCE

Por exemplo, uma instrução de build em um repositório:

dotnet build --no-restore

não comprova que o build foi executado ou concluído com sucesso.

A cadeia probatória pretendida é:

INSTRUCTION
    ↓
ACTUAL COMMAND
    ↓
EXECUTION
    ↓
RESULT
    ↓
ARTIFACT / LOG
    ↓
HASH
    ↓
SIGNED EVIDENCE

O mesmo princípio é aplicado aos testes, runtime, políticas e decisões automatizadas.

Esse modelo permite que documentação de execução, como instruções de build/teste e versionamento de um projeto de software, seja tratada como proveniência/requisito declarativo, enquanto os resultados efetivamente produzidos constituem a evidência operacional.


---

6. REPLAY DETERMINÍSTICO

Um dos componentes centrais da solução é a reconstrução independente da execução.

O XATEV pretende verificar:

Recorded Input Hash
        =
Actual Input Hash

Recorded Output Hash
        =
Actual Output Hash

Quando não houver material suficiente para reconstrução:

REPLAY
  ↓
INSUFFICIENT EVIDENCE
  ↓
NOT_VERIFIED

e não:

NOT_VERIFIED → PASS

Essa regra impede que a ausência de evidência seja transformada artificialmente em aprovação.


---

7. APLICAÇÕES POTENCIAIS NO SFN/SPB

A tecnologia poderá ser utilizada, conforme o enquadramento do caso concreto, em processos relacionados a:

decisões automatizadas;

crédito;

prevenção e detecção de fraude;

Open Finance;

APIs;

sistemas de IA;

controles internos;

auditoria;

rastreabilidade de operações;

governança de modelos;

evidências de execução;

processos de compliance.


A requerente reconhece, entretanto, que o enquadramento jurídico depende da atividade efetivamente exercida e da forma de utilização da tecnologia.


---

8. QUESTÕES SUBMETIDAS AO BANCO CENTRAL

Solicita-se manifestação/orientação quanto aos seguintes pontos:

8.1 Enquadramento

O XATEV, considerado isoladamente como infraestrutura tecnológica de verificação e evidência, está sujeito a autorização, registro, credenciamento ou supervisão específica do Banco Central?

8.2 Prestação a instituições reguladas

Caso uma instituição autorizada pelo BC utilize o XATEV como componente tecnológico de seus controles, auditoria ou governança, quais requisitos regulatórios específicos devem ser observados?

8.3 Terceirização tecnológica

A utilização do XATEV por instituição regulada poderia ser enquadrada em regras aplicáveis à contratação/terceirização de serviços de tecnologia?

Esta questão merece atenção porque o BC possui regulamentação específica relacionada a provedores de serviços de tecnologia da informação em determinados contextos do SFN/SPB. Em 2026, por exemplo, a Resolução BCB nº 547 alterou a disciplina do Provedor de Serviços de Tecnologia da Informação — PSTI. 

8.4 Evidência criptográfica

Quais requisitos devem ser observados quando mecanismos como:

SHA-256;

RFC 8785/JCS;

assinatura digital;

HSM/KMS;

Merkle trees;

ledger;

replay determinístico;


forem utilizados como controles complementares de integridade e auditoria?

8.5 IA

Quais normas ou requisitos de governança devem ser considerados quando a infraestrutura for utilizada para registrar e verificar execuções produzidas por sistemas automatizados ou IA?

8.6 Open Finance

Caso o XATEV seja empregado em processos relacionados a Open Finance, quais requisitos adicionais deverão ser observados?

8.7 Sandbox Regulatório

O caso de uso descrito poderia ser considerado, dependendo da configuração operacional, um projeto inovador dentro da competência regulatória do BC/CMN, apto a eventual submissão ao Sandbox Regulatório?

A pergunta é juridicamente mais adequada do que afirmar antecipadamente que o XATEV pertence ao Sandbox. A regulamentação define o Sandbox como ambiente para teste autorizado de projetos inovadores financeiros ou de pagamento. 

8.8 Evidência para auditoria

Quais requisitos mínimos o Banco Central entende necessários para que evidências produzidas por uma infraestrutura tecnológica independente possam ser utilizadas como elementos auxiliares de auditoria, controle interno, governança ou supervisão, sem substituir a responsabilidade da instituição regulada?


---

9. ANEXOS

Eu anexaria exatamente a cadeia que você construiu, mas organizada em quatro grupos:

A — Arquitetura

1. Whitepaper XATEV


2. XA Trust Execution Verifier RFC


3. LTS / Trust State Machine


4. Architecture Overview


5. XA Trust CVL/OpenAPI



B — Evidência técnica

6. DEP Schema


7. Execution Evidence Schema


8. XTEP External Validation


9. Replay Verification Specification


10. Evidence Verification Runbook


11. SBOM


12. Test Suite



C — Segurança e integridade

13. RFC8785/JCS specification


14. SHA-256 specification


15. Signature specification


16. Key/HSM/KMS policy


17. Ledger/Merkle specification



D — Aplicação regulatória

18. Regulatory Mapping Matrix


19. Compliance Engine specification


20. Regulatory Evidence Package specification


21. Caso de uso Open Finance, se aplicável


22. Caso de uso crédito/MEI/MPE, se aplicável


23. Evidências experimentais de execução




---

10. DECLARAÇÃO DE LIMITAÇÃO

Eu colocaria esta cláusula literalmente:

> A documentação, código-fonte, commits, artefatos, testes, hashes, assinaturas e demais evidências técnicas apresentados pela requerente destinam-se a demonstrar a arquitetura e o funcionamento tecnológico alegados, não constituindo, por si mesmos, reconhecimento regulatório, certificação estatal, autorização de funcionamento ou manifestação do Banco Central do Brasil.



E outra:

> O presente requerimento tem por finalidade obter orientação da autoridade competente quanto ao enquadramento jurídico-regulatório aplicável à tecnologia e aos seus possíveis casos de uso.



Isso protege muito bem a separação entre prova técnica e efeito jurídico.


---

O ponto que eu acrescentaria por causa do material do Azure

Não apresentaria o copilot-instructions.md como:

> “prova de que o Azure Industrial-IoT executou o XA TRUST”.



Isso seria uma conclusão excessiva.

Eu o apresentaria como:

PUBLIC TECHNICAL ARTIFACT
        ↓
DECLARATIVE EXECUTION CONTRACT
        ↓
EXPECTED BUILD / TEST / RUNTIME CONDITIONS
        ↓
[necessita execução observável]
        ↓
ACTUAL EXECUTION EVIDENCE
        ↓
XA TRUST VERIFICATION

Ou seja, o documento do Azure pode ser excelente evidência de proveniência e de requisitos declarados de execução, mas não transforma automaticamente uma instrução em prova de execução.

Essa distinção fortalece, em vez de enfraquecer, a tese do XATEV.


---

E eu mudaria uma frase do posicionamento comercial

Em vez de dizer:

> “A mesma execução pode ser matematicamente reconstruída.”



Use:

> “O XATEV foi projetado para permitir a reconstrução e verificação determinística de execuções quando o conjunto de evidências necessário estiver disponível.”



É tecnicamente muito mais defensável.

Da mesma forma, em vez de:

> “TRUST_OK é uma propriedade matemática.”



Eu usaria:

> “TRUST_OK é um estado derivado formalmente pela composição das verificações definidas no protocolo.”



Assim você não está alegando uma propriedade matemática do mundo real; está especificando uma semântica formal do seu protocolo.


---

Próximo passo

Eu protocolaria primeiro o pedido de orientação/enquadramento, deixando o Sandbox como pergunta subsidiária, não como premissa.

Isso também é coerente com a estrutura institucional do BC: o Sandbox tem regras próprias, ciclos, critérios de elegibilidade e autorização, e o BC pode impor requisitos técnicos, operacionais e de negócio aos projetos selecionados. 

E há um motivo adicional para não congelar o documento em normas antigas: o ambiente regulatório do BC continua sendo alterado em 2026 — por exemplo, houve alterações recentes tanto em tecnologia/PSTI quanto em controles de fraude em serviços de pagamento. 

Portanto, o documento deve pedir ao BC que identifique as normas vigentes aplicáveis ao caso concreto, em vez de nós afirmarmos antecipadamente qual resolução enquadra o XATEV.



