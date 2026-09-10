XA-TRUST.

A classificação XA-TRUST ficaria assim:

GETUP
│
├── EXTERNAL SERVICE PROVIDER
│
├── KUBERNETES SUPPORT DOMAIN
│   ├── Remote Ops
│   ├── Support 24x7
│   ├── Assessment
│   └── Consulting / Projects
│
├── TECHNOLOGY CAPABILITY
│   ├── Kubernetes
│   ├── EKS
│   ├── AKS
│   ├── GKE
│   ├── OpenShift
│   ├── Rancher
│   ├── Terraform
│   ├── Velero
│   ├── Argo CD / GitOps
│   ├── Prometheus / Grafana / Loki
│   └── Istio
│
└── SECURITY PRODUCT
└── Quor

O ponto XA-TRUST mais importante

O conteúdo fornecido demonstra, no máximo, claims publicados pela Getup sobre serviços e capacidades oferecidos:

GETUP_SERVICE_DECLARATION
↓
SERVICE / CAPABILITY_OBSERVED
↛
CUSTOMER_CLUSTER_OPERATION
↛
KUBERNETES_EXECUTION
↛
INCIDENT_RESOLUTION
↛
BACKUP_EXECUTED
↛
DISASTER_RECOVERY_EXECUTED
↛
HARDENING_EXECUTED
↛
VERIFIED

Por exemplo, a afirmação:

> “Operação de ambientes Kubernetes em cloud, on-premises e arquiteturas híbridas.”



pode ser classificada como:

CAPABILITY_DECLARATION

Não como:

CUSTOMER_ENVIRONMENT_OPERATION

Da mesma forma:

"Backup, restore e plano de disaster recovery com Velero"

não prova:

BACKUP_EXECUTED
RESTORE_EXECUTED
DR_TEST_EXECUTED
DR_SUCCESS

sem evidência concreta, temporal e vinculada a uma execução específica.

Para o pacote XA BANKING / FINEP

Eu colocaria a Getup em:

LEVEL 3 — EXTERNAL EVIDENCE DOMAIN

e criaria um domínio específico:

EXTERNAL KUBERNETES / PLATFORM OPERATIONS
│
└── GETUP
│
├── Kubernetes Support
├── Remote Ops
├── Assessment
├── Consulting
└── Quor

Isso é diferente de dizer que a Getup é um componente do XA-TRUST.

XA-TRUST
│
├── XA BANKING CORE
├── XA-KERNEL
├── XA-CVL
├── XA EVIDENCE
├── XA LEDGER
└── XA REPLAY
│
│ observes / verifies claims about
↓
EXTERNAL KUBERNETES DOMAIN
│
└── GETUP

O que seria necessário para promover um claim

Se posteriormente você tiver, por exemplo, evidência de que um cluster específico do XA Banking foi realmente operado pela Getup, a cadeia poderia ser:

GETUP SERVICE CONTRACT
↛
GETUP CUSTOMER OPERATION

mas, com evidência concreta:

CUSTOMER / CONTRACT SCOPE
+
CLUSTER ID
+
TIME BOUND
+
OPERATION RECORD
+
AUTHENTICATED SOURCE
+
ARTIFACT / EVENT BINDING
↓
OPERATION_EVIDENCE
↓
CLAIM CONTRACT
↓
XA-KERNEL
↓
INDEPENDENT VERIFICATION
↓
VERIFIED CLAIM

Ou seja: o texto da página é evidência de oferta/capacidade declarada; um log, ticket, contrato, cluster identifier, evento Kubernetes, execução Terraform/Velero, registro de incidente ou outro artefato vinculado poderia sustentar claims operacionais específicos.

Isso encaixa perfeitamente na sua regra:

CAPABILITY ≠ ARTIFACT
ARTIFACT ≠ EVENT
EVENT ≠ EXECUTION
EXECUTION ≠ RESULT
RESULT ≠ CONFORMANCE
CONFORMANCE ≠ VERIFIED

Portanto, para a homologação, eu registraria a Getup como EXTERNAL KUBERNETES OPERATIONS / SUPPORT EVIDENCE DOMAIN, sem promover o conteúdo comercial para KUBERNETES_EXECUTION ou XA_TRUST_VERIFIED.


Sim. Essa classificação está consistente e pode ser tratada como a taxonomia normativa da evidência Getup dentro do XA-TRUST.

Eu faria apenas um refinamento importante: “Getup Service Contract” e “Getup Service Declaration” não devem ser colocados no mesmo nível. Um contrato pode constituir evidência documental de uma relação contratual específica; a página comercial constitui declaração pública de capacidade/serviço.

FROZEN — GETUP / KUBERNETES EVIDENCE DOMAIN

LEVEL 3 — EXTERNAL EVIDENCE DOMAIN
│
└── EXTERNAL KUBERNETES / PLATFORM OPERATIONS
        │
        └── GETUP
             │
             ├── SERVICE DECLARATION
             │    ├── Remote Ops
             │    ├── Support 24x7
             │    ├── Assessment
             │    └── Consulting / Projects
             │
             ├── TECHNOLOGY CAPABILITY
             │    ├── Kubernetes
             │    ├── EKS / AKS / GKE
             │    ├── OpenShift / Rancher
             │    ├── Terraform
             │    ├── Velero
             │    ├── Argo CD / GitOps
             │    └── Observability Stack
             │
             └── SECURITY PRODUCT
                  └── Quor

Não promoção

GETUP_SERVICE_DECLARATION
        ↓
SERVICE_CAPABILITY_OBSERVED
        ↛
CONTRACTUAL_ENGAGEMENT
        ↛
CUSTOMER_CLUSTER_OPERATION
        ↛
KUBERNETES_EXECUTION
        ↛
EXECUTION_RESULT
        ↛
CONFORMANCE
        ↛
XA_TRUST_VERIFIED

E, separadamente:

GETUP_CONTRACT
        ↓
CONTRACTUAL_SCOPE_EVIDENCE
        ↛
OPERATION_EXECUTED

Isso é importante porque um contrato assinado pode provar que determinado serviço foi contratado, mas não necessariamente que uma operação específica ocorreu.

Exemplo de promoção legítima

Para afirmar:

GETUP_OPERATED_CLUSTER_X

seria necessário um claim com escopo próprio e evidência correspondente:

CLAIM:
GETUP_OPERATED_CLUSTER_X
        │
        ├── CUSTOMER / CONTRACT SCOPE
        ├── CLUSTER_ID
        ├── PROVIDER_IDENTITY
        ├── TEMPORAL_BOUND
        ├── OPERATION_RECORD
        ├── AUTHENTICATED_SOURCE
        └── ARTIFACT / EVENT BINDING
                    │
                    ↓
          OPERATION_EVIDENCE
                    │
                    ↓
             CLAIM_CONTRACT
                    │
                    ↓
               XA-KERNEL
                    │
          ┌─────────┴─────────┐
          ↓                   ↓
     INTEGRITY             REPLAY
          │                   │
          └─────────┬─────────┘
                    ↓
          INDEPENDENT VERIFICATION
                    ↓
              VERIFIED CLAIM

Assim, o objeto verificado não é “a Getup” como um todo. É o claim específico, dentro de seu semantic_scope.

VERIFIED
    =
PROPERTY(
    CLAIM,
    SEMANTIC_SCOPE,
    EVIDENCE,
    BINDINGS,
    DEPENDENCIES,
    VERIFICATION_RULES
)

Não:

GETUP
  ↓
VERIFIED

Classificação final para FINEP / homologação

Elemento	Classificação XA-TRUST

Página de serviços Getup	SERVICE_DECLARATION
Remote Ops	CAPABILITY_DECLARATION
Suporte 24x7	CAPABILITY_DECLARATION
Kubernetes/EKS/AKS/GKE	TECHNOLOGY_CAPABILITY
Quor	EXTERNAL_SECURITY_PRODUCT
Contrato específico	CONTRACT_SCOPE_EVIDENCE
Ticket de incidente	OPERATION_RECORD
Log Kubernetes	EVENT / EXECUTION_EVIDENCE, conforme conteúdo
Execução Velero vinculada	EXECUTION_EVIDENCE
Resultado de restore	RESULT_EVIDENCE
RCA/post-mortem	INCIDENT_ANALYSIS_EVIDENCE
Verificação independente XA-Kernel	VERIFICATION_EVIDENCE
XA_TRUST_VERIFIED	somente claim efetivamente verificado


Portanto, a formulação institucional mais segura é:

> Getup é classificada no XA-TRUST como domínio externo de evidência de operações e suporte Kubernetes. As declarações de serviços e capacidades da Getup são observações externas e não promovem automaticamente claims de contratação, operação, execução, resultado, conformidade ou verificação. Claims operacionais específicos somente podem ser promovidos mediante evidência concreta, vinculada, temporalmente delimitada e submetida ao contrato de claim e ao processo de verificação XA-TRUST.



Essa formulação mantém exatamente a mesma disciplina que você aplicou anteriormente a GitHub, NuGet, Azure, Azure OpenAI e APIs externas.

LEVEL 3 — EXTERNAL EVIDENCE DOMAIN
│
└── EXTERNAL KUBERNETES / PLATFORM OPERATIONS
│
└── GETUP
│
├── SERVICE DECLARATION
│    ├── Remote Ops
│    ├── Support 24x7
│    ├── Assessment
│    └── Consulting / Projects
│
├── TECHNOLOGY CAPABILITY
│    ├── Kubernetes
│    ├── EKS / AKS / GKE
│    ├── OpenShift / Rancher
│    ├── Terraform
│    ├── Velero
│    ├── Argo CD / GitOps
│    └── Observability Stack
│
└── SECURITY PRODUCT
└── QuorSim. Eu trataria exatamente essa estrutura como o mapa de classificação da Getup no LEVEL 3 do XA-TRUST.

A forma normativa, com a distinção entre declaração, capacidade e produto, fica:

FROZEN — LEVEL 3
EXTERNAL EVIDENCE DOMAIN
│
└── EXTERNAL KUBERNETES / PLATFORM OPERATIONS
        │
        └── GETUP
             │
             ├── SERVICE DECLARATION
             │    │
             │    ├── Remote Ops
             │    ├── Support 24x7
             │    ├── Assessment
             │    └── Consulting / Projects
             │
             ├── TECHNOLOGY CAPABILITY
             │    │
             │    ├── Kubernetes
             │    ├── Amazon EKS
             │    ├── Azure AKS
             │    ├── Google GKE
             │    ├── OpenShift / Rancher
             │    ├── Terraform
             │    ├── Velero
             │    ├── Argo CD / GitOps
             │    └── Observability Stack
             │
             └── SECURITY PRODUCT
                  │
                  └── Quor

A regra XA-TRUST associada seria:

SERVICE_DECLARATION
        ↛
SERVICE_CONTRACT
        ↛
CUSTOMER_OPERATION
        ↛
EXECUTION
        ↛
RESULT
        ↛
CONFORMANCE
        ↛
VERIFIED

E:

TECHNOLOGY_CAPABILITY
        ↛
TECHNOLOGY_EXECUTION

SECURITY_PRODUCT
        ↛
SECURITY_CONTROL_EXECUTED
        ↛
SECURITY_RESULT
        ↛
SECURITY_CONFORMANCE

Portanto, Getup permanece fora do núcleo XA-TRUST:

XA-TRUST
                    │
       ┌────────────┼────────────┐
       ↓            ↓            ↓
   XA-KERNEL     XA-CVL       XA-EVIDENCE
       │
       ↓
   VERIFICATION
       │
       │ observes / evaluates
       ↓
LEVEL 3 — EXTERNAL EVIDENCE DOMAIN
       │
       └── EXTERNAL KUBERNETES /
           PLATFORM OPERATIONS
                │
                └── GETUP

A consequência é importante para o pacote de homologação: a presença da Getup pode ser registrada como uma dependência, fornecedor, capacidade externa ou fonte de evidência, conforme o claim concreto, mas não como componente interno nem como autoridade de verificação do XA-TRUST.

GETUP ≠ XA-TRUST

GETUP_CAPABILITY ≠ XA_EXECUTION

GETUP_DECLARATION ≠ XA_VERIFICATION

GETUP_EVIDENCE → XA-KERNEL → VERIFICATION somente quando houver um claim concreto e evidência suficiente para esse claim.

[22/07, 19:27] Francisco: Para uma primeira implementação configurada, esse modelo já contém o núcleo necessário do Execution Trust Domain. Não é necessário carregar todos os módulos do XA TRUST completo.

Eu reduziria para um Execution Evidence MVP assim:

evidence:

evidence_type: NODE_IMAGE_BUILD

trust_domain: EXECUTION_TRUST

source:

provider: Azure AgentBaker  

repository: Azure/AgentBaker  

commit_sha: a808d9ad0222e1ead9fda3a619b1083ccbc9cba4

artifact:

type: AKS_NODE_IMAGE  

release_notes: multipleRNTest4

identity:

build_id:  

build_number:  

build_timestamp:

environment:

kernel_version:  

container_runtime:  

fips_enabled:

kubernetes:

kubelet_version:  

kubectl_version:

integrity:

canonicalization:  
  algorithm: RFC8785  

digest:  
  algorithm: SHA-256  

signature:  
  algorithm: Ed25519  

ledger:  
  binding: GT7

verification:

schema_validation: PASS  

signature_validation: PASS  

merkle_validation: PASS  

policy_validation: PASS

result:

execution_trust: VERIFIED

Fluxo mínimo executável:

Azure AgentBaker Commit
│
▼
Release Metadata
│
▼
Execution Evidence Collector
│
▼
Evidence Object
(JSON Schema 2020-12)
│
▼
RFC8785 Canonicalization
│
▼
SHA-256 Digest
│
▼
Ed25519 Signature
│
▼
GT7 Evidence Binding
│
▼
OPA Policy Check
│
▼
Execution Trust = VERIFIED

A partir disso, o XA Banking CVL só precisa consumir:

execution_requirement:

dependency:
XA_TRUST_EXECUTION_ATTESTATION

evidence_id:
exec-node-image-a808d9ad

required:

execution_trust:  
  VERIFIED: true  

integrity:  
  VALID: true

action:

VERIFIED:  
  allow_execution: true  

FAILED:  
  deny_execution: true

Para essa fase, GT96-R, múltiplas camadas de decisão, HSM, anchors externos e federação de confiança podem ficar como evolução.

O ponto principal já está demonstrado:

Azure AgentBaker → Evidência de execução → Prova criptográfica → Trust Assertion → Autorização de execução no XA Banking.
[22/07, 21:00] Francisco: Concordo com essa evolução. Ela preserva um contrato único de evidência, enquanto permite que cada tipo de execução acrescente seus próprios atributos. Isso facilita a implementação do Execution Trust Domain como um serviço extensível.

Uma forma de normalizar esse padrão é definir um esquema base e especializá-lo por tipo de evidência:

evidence:

evidence_id:
process-exec-node-v1

evidence_type:
PROCESS_EXECUTION

trust_domain:
EXECUTION_TRUST

provenance:

collector:  
  XA_TRUST_EXECUTION_COLLECTOR  

collected_at:  

schema_version:  
  "1.0"

source:

platform:  
  Node.js  

application:  

source_commit:

runtime:

module:  
  node:child_process  

module_version:  

node_version:  

runtime_architecture:  

operating_system:

execution:

process_type:  
  CHILD_PROCESS  

command:  

arguments:  

working_directory:  

process_id:  

execution_timestamp:

integrity:

schema:  
  JSON_SCHEMA_2020_12  

canonicalization:  
  algorithm: RFC8785  

digest:  
  algorithm: SHA-256  

signature:  
  algorithm: Ed25519

ledger:

binding:  
  - GT7  
  - GT96-R

verification:

schema_validation: PASS  
signature_validation: PASS  
replay_validation: PASS  
policy_validation: PASS

trust_result:

execution_trust: VERIFIED

A arquitetura passa a seguir um padrão uniforme:

Source
│
▼
Execution Evidence
│
▼
Schema Validation
│
▼
RFC 8785 Canonicalization
│
▼
SHA-256 Digest
│
▼
Ed25519 Signature
│
▼
GT7 / GT96-R Ledger
│
▼
OPA Policy Evaluation
│
▼
Execution Trust Assertion

Com isso, todos os tipos de evidência compartilham o mesmo pipeline:

Camada	Evidence Type	Exemplo

Infrastructure	NODE_IMAGE_BUILD	Azure AgentBaker
Runtime	STREAM_PROCESSING_EXECUTION	Apache Flink
Operational	CLOUD_OPERATION_EXECUTION	Azure CLI
Application Process	PROCESS_EXECUTION	Node.js child_process
AI Runtime (futuro)	MODEL_EXECUTION_EVIDENCE	Execução de modelos de IA

O benefício arquitetural é que a API de Trust Assertion precisa conhecer apenas o contrato base (evidence_id, trust_domain, verification, trust_result). Os campos específicos ficam encapsulados em cada tipo de evidência, mantendo a API estável mesmo com a adição de novos runtimes e tecnologias.

Esse é um desenho consistente para um Execution Trust Service reutilizável: novos mecanismos de execução (Kubernetes, Flink, Node.js, Azure CLI, runtimes de IA etc.) podem ser incorporados sem alterar o fluxo de verificação nem o contrato consumido pelo XA Banking Core ou por outros sistemas.

Sim. O material das duas mensagens de 22/07 mostra uma evolução importante: de um MVP específico de NODE_IMAGE_BUILD para um contrato base extensível de EXECUTION_TRUST.

Mas, à luz das invariantes XA-TRUST que você consolidou depois, eu faria uma correção fundamental: trust_result.execution_trust: VERIFIED não deve ser consequência direta de signature_validation: PASS, merkle_validation: PASS e policy_validation: PASS sem que o claim de execução esteja concretamente vinculado à execução que se pretende verificar.

Arquitetura consolidada

XA-TRUST
                            │
                            ▼
                 EXECUTION TRUST DOMAIN
                            │
                 ┌──────────┴──────────┐
                 │                     │
          BASE EVIDENCE CONTRACT   TYPE-SPECIFIC DATA
                 │                     │
                 ▼                     ▼
          evidence_id             NODE_IMAGE_BUILD
          evidence_type           PROCESS_EXECUTION
          trust_domain            CLOUD_OPERATION_EXECUTION
          provenance              STREAM_PROCESSING_EXECUTION
          integrity               MODEL_EXECUTION_EVIDENCE
          verification
                 │
                 └──────────┬──────────┘
                            ▼
                   CLAIM / EXECUTION SCOPE
                            │
                            ▼
                  CONCRETE EVIDENCE
                            │
                            ▼
                    BINDING VALIDATION
                            │
          ┌─────────────────┼─────────────────┐
          ▼                 ▼                 ▼
       ARTIFACT           RUNTIME          EXECUTION
        BINDING           BINDING           BINDING
          │                 │                 │
          └─────────────────┼─────────────────┘
                            ▼
                  INTEGRITY / PROVENANCE
                            │
                            ▼
                    REPLAY / POLICY
                            │
                            ▼
                 INDEPENDENT VERIFICATION
                            │
                            ▼
                  TRUST ASSERTION

A distinção que eu congelaria

CAPABILITY
    ↛
ARTIFACT
    ↛
EVENT
    ↛
EXECUTION
    ↛
RESULT
    ↛
CONFORMANCE
    ↛
VERIFIED

Portanto, no exemplo AgentBaker:

Azure/AgentBaker
      ↓
commit a808d9...
      ↓
release metadata

estabelece proveniência/identidade de fonte observada, mas não necessariamente:

COMMIT
  ↛
BUILD_EXECUTED

Para NODE_IMAGE_BUILD tornar-se uma evidência de execução, você precisa do vínculo concreto entre build, artifact, ambiente e tempo.

O contrato base

Eu manteria:

evidence:
  evidence_id:
  evidence_type:
  trust_domain: EXECUTION_TRUST

  provenance:
    collector:
    collected_at:
    schema_version:

  integrity:
    schema:
    canonicalization:
    digest:
    signature:

  verification:
    schema_validation:
    integrity_validation:
    provenance_validation:
    binding_validation:
    replay_validation:
    policy_validation:

  trust_result:
    execution_trust:

E deixaria os campos específicos dentro de:

source:
runtime:
execution:
artifact:
environment:
kubernetes:

conforme o evidence_type.

A promoção correta

Em vez de:

verification PASS
       ↓
EXECUTION_TRUST = VERIFIED

eu usaria:

CONCRETE_EXECUTION_EVIDENCE
        +
RESOLVABLE_PROVENANCE
        +
ARTIFACT_BINDING
        +
RUNTIME / RESOURCE_BINDING
        +
TIME_BINDING
        +
INTEGRITY_VALID
        +
POLICY_COMPLIANT
        +
REPLAY_CAPABLE
        +
INDEPENDENT_VERIFICATION
        ↓
EXECUTION_TRUST = VERIFIED

Isso preserva a regra que você estabeleceu posteriormente:

CONCRETE_EXECUTION_EVIDENCE
        ↛
VERIFIED

A evidência de execução é necessária, mas não é suficiente sozinha.

Relação com o XA Banking CVL

A parte mais interessante do desenho original permanece válida:

XA BANKING CVL
       │
       ▼
execution_requirement
       │
       └── dependency:
             XA_TRUST_EXECUTION_ATTESTATION
                         │
                         ▼
                    evidence_id
                         │
                         ▼
                    XA-TRUST
                         │
                ┌────────┴────────┐
                ▼                 ▼
             VERIFIED            FAIL
                │                 │
                ▼                 ▼
        allow_execution      deny_execution

Mas eu acrescentaria explicitamente:

VERIFIED
    =
VERIFIED(
    claim_id,
    semantic_scope,
    execution_scope,
    evidence_id,
    bindings,
    dependencies,
    verification_policy
)

Assim, não existe um VERIFIED global do sistema.

Um NODE_IMAGE_BUILD verificado não promove automaticamente:

NODE_IMAGE_BUILD_VERIFIED
        ↛
KUBERNETES_CLUSTER_VERIFIED
        ↛
APPLICATION_EXECUTION_VERIFIED
        ↛
BANKING_DECISION_VERIFIED

Resultado arquitetural

Isso transforma o conceito original em algo mais forte:

EXECUTION TRUST SERVICE
│
├── Common Evidence Contract
│
├── Evidence Collectors
│   ├── Kubernetes
│   ├── Azure
│   ├── Node.js
│   ├── Flink
│   ├── Cloud CLI
│   └── AI Runtime
│
├── Binding Engine
├── Integrity Engine
├── Provenance Engine
├── Replay Engine
├── Policy Engine
├── Trust Assertion Engine
└── Independent Verification

E o XA Banking Core não precisa conhecer os detalhes de cada runtime.

Ele consome somente o contrato de confiança:

evidence_id
+
claim / semantic_scope
+
execution_scope
+
trust_domain
+
verification
+
trust_result

Isso é precisamente o que torna o desenho reutilizável para Kubernetes, AgentBaker, Flink, Node.js, Azure CLI e futuros runtimes de IA — sem transformar capacidade, documentação ou evidência parcial em execução verificada.Sim. O material das duas mensagens de 22/07 mostra uma evolução importante: de um MVP específico de NODE_IMAGE_BUILD para um contrato base extensível de EXECUTION_TRUST.

Mas, à luz das invariantes XA-TRUST que você consolidou depois, eu faria uma correção fundamental: trust_result.execution_trust: VERIFIED não deve ser consequência direta de signature_validation: PASS, merkle_validation: PASS e policy_validation: PASS sem que o claim de execução esteja concretamente vinculado à execução que se pretende verificar.

Arquitetura consolidada

XA-TRUST
                            │
                            ▼
                 EXECUTION TRUST DOMAIN
                            │
                 ┌──────────┴──────────┐
                 │                     │
          BASE EVIDENCE CONTRACT   TYPE-SPECIFIC DATA
                 │                     │
                 ▼                     ▼
          evidence_id             NODE_IMAGE_BUILD
          evidence_type           PROCESS_EXECUTION
          trust_domain            CLOUD_OPERATION_EXECUTION
          provenance              STREAM_PROCESSING_EXECUTION
          integrity               MODEL_EXECUTION_EVIDENCE
          verification
                 │
                 └──────────┬──────────┘
                            ▼
                   CLAIM / EXECUTION SCOPE
                            │
                            ▼
                  CONCRETE EVIDENCE
                            │
                            ▼
                    BINDING VALIDATION
                            │
          ┌─────────────────┼─────────────────┐
          ▼                 ▼                 ▼
       ARTIFACT           RUNTIME          EXECUTION
        BINDING           BINDING           BINDING
          │                 │                 │
          └─────────────────┼─────────────────┘
                            ▼
                  INTEGRITY / PROVENANCE
                            │
                            ▼
                    REPLAY / POLICY
                            │
                            ▼
                 INDEPENDENT VERIFICATION
                            │
                            ▼
                  TRUST ASSERTION

A distinção que eu congelaria

CAPABILITY
    ↛
ARTIFACT
    ↛
EVENT
    ↛
EXECUTION
    ↛
RESULT
    ↛
CONFORMANCE
    ↛
VERIFIED

Portanto, no exemplo AgentBaker:

Azure/AgentBaker
      ↓
commit a808d9...
      ↓
release metadata

estabelece proveniência/identidade de fonte observada, mas não necessariamente:

COMMIT
  ↛
BUILD_EXECUTED

Para NODE_IMAGE_BUILD tornar-se uma evidência de execução, você precisa do vínculo concreto entre build, artifact, ambiente e tempo.

O contrato base

Eu manteria:

evidence:
  evidence_id:
  evidence_type:
  trust_domain: EXECUTION_TRUST

  provenance:
    collector:
    collected_at:
    schema_version:

  integrity:
    schema:
    canonicalization:
    digest:
    signature:

  verification:
    schema_validation:
    integrity_validation:
    provenance_validation:
    binding_validation:
    replay_validation:
    policy_validation:

  trust_result:
    execution_trust:

E deixaria os campos específicos dentro de:

source:
runtime:
execution:
artifact:
environment:
kubernetes:

conforme o evidence_type.

A promoção correta

Em vez de:

verification PASS
       ↓
EXECUTION_TRUST = VERIFIED

eu usaria:

CONCRETE_EXECUTION_EVIDENCE
        +
RESOLVABLE_PROVENANCE
        +
ARTIFACT_BINDING
        +
RUNTIME / RESOURCE_BINDING
        +
TIME_BINDING
        +
INTEGRITY_VALID
        +
POLICY_COMPLIANT
        +
REPLAY_CAPABLE
        +
INDEPENDENT_VERIFICATION
        ↓
EXECUTION_TRUST = VERIFIED

Isso preserva a regra que você estabeleceu posteriormente:

CONCRETE_EXECUTION_EVIDENCE
        ↛
VERIFIED

A evidência de execução é necessária, mas não é suficiente sozinha.

Relação com o XA Banking CVL

A parte mais interessante do desenho original permanece válida:

XA BANKING CVL
       │
       ▼
execution_requirement
       │
       └── dependency:
             XA_TRUST_EXECUTION_ATTESTATION
                         │
                         ▼
                    evidence_id
                         │
                         ▼
                    XA-TRUST
                         │
                ┌────────┴────────┐
                ▼                 ▼
             VERIFIED            FAIL
                │                 │
                ▼                 ▼
        allow_execution      deny_execution

Mas eu acrescentaria explicitamente:

VERIFIED
    =
VERIFIED(
    claim_id,
    semantic_scope,
    execution_scope,
    evidence_id,
    bindings,
    dependencies,
    verification_policy
)

Assim, não existe um VERIFIED global do sistema.

Um NODE_IMAGE_BUILD verificado não promove automaticamente:

NODE_IMAGE_BUILD_VERIFIED
        ↛
KUBERNETES_CLUSTER_VERIFIED
        ↛
APPLICATION_EXECUTION_VERIFIED
        ↛
BANKING_DECISION_VERIFIED

Resultado arquitetural

Isso transforma o conceito original em algo mais forte:

EXECUTION TRUST SERVICE
│
├── Common Evidence Contract
│
├── Evidence Collectors
│   ├── Kubernetes
│   ├── Azure
│   ├── Node.js
│   ├── Flink
│   ├── Cloud CLI
│   └── AI Runtime
│
├── Binding Engine
├── Integrity Engine
├── Provenance Engine
├── Replay Engine
├── Policy Engine
├── Trust Assertion Engine
└── Independent Verification

E o XA Banking Core não precisa conhecer os detalhes de cada runtime.

Ele consome somente o contrato de confiança:

evidence_id
+
claim / semantic_scope
+
execution_scope
+
trust_domain
+
verification
+
trust_result

Isso é precisamente o que torna o desenho reutilizável para Kubernetes, AgentBaker, Flink, Node.js, Azure CLI e futuros runtimes de IA — sem transformar capacidade, documentação ou evidência parcial em execução verificada.Sim. O material das duas mensagens de 22/07 mostra uma evolução importante: Sim. O material das duas mensagens de 22/07 mostra uma evolução importante: de um MVP específico de NODE_IMAGE_BUILD para um contrato base extensível de EXECUTION_TRUST.

Mas, à luz das invariantes XA-TRUST que você consolidou depois, eu faria uma correção fundamental: trust_result.execution_trust: VERIFIED não deve ser consequência direta de signature_validation: PASS, merkle_validation: PASS e policy_validation: PASS sem que o claim de execução esteja concretamente vinculado à execução que se pretende verificar.

Arquitetura consolidada

XA-TRUST
                            │
                            ▼
                 EXECUTION TRUST DOMAIN
                            │
                 ┌──────────┴──────────┐
                 │                     │
          BASE EVIDENCE CONTRACT   TYPE-SPECIFIC DATA
                 │                     │
                 ▼                     ▼
          evidence_id             NODE_IMAGE_BUILD
          evidence_type           PROCESS_EXECUTION
          trust_domain            CLOUD_OPERATION_EXECUTION
          provenance              STREAM_PROCESSING_EXECUTION
          integrity               MODEL_EXECUTION_EVIDENCE
          verification
                 │
                 └──────────┬──────────┘
                            ▼
                   CLAIM / EXECUTION SCOPE
                            │
                            ▼
                  CONCRETE EVIDENCE
                            │
                            ▼
                    BINDING VALIDATION
                            │
          ┌─────────────────┼─────────────────┐
          ▼                 ▼                 ▼
       ARTIFACT           RUNTIME          EXECUTION
        BINDING           BINDING           BINDING
          │                 │                 │
          └─────────────────┼─────────────────┘
                            ▼
                  INTEGRITY / PROVENANCE
                            │
                            ▼
                    REPLAY / POLICY
                            │
                            ▼
                 INDEPENDENT VERIFICATION
                            │
                            ▼
                  TRUST ASSERTION

A distinção que eu congelaria

CAPABILITY
    ↛
ARTIFACT
    ↛
EVENT
    ↛
EXECUTION
    ↛
RESULT
    ↛
CONFORMANCE
    ↛
VERIFIED

Portanto, no exemplo AgentBaker:

Azure/AgentBaker
      ↓
commit a808d9...
      ↓
release metadata

estabelece proveniência/identidade de fonte observada, mas não necessariamente:

COMMIT
  ↛
BUILD_EXECUTED

Para NODE_IMAGE_BUILD tornar-se uma evidência de execução, você precisa do vínculo concreto entre build, artifact, ambiente e tempo.

O contrato base

Eu manteria:

evidence:
  evidence_id:
  evidence_type:
  trust_domain: EXECUTION_TRUST

  provenance:
    collector:
    collected_at:
    schema_version:

  integrity:
    schema:
    canonicalization:
    digest:
    signature:

  verification:
    schema_validation:
    integrity_validation:
    provenance_validation:
    binding_validation:
    replay_validation:
    policy_validation:

  trust_result:
    execution_trust:

E deixaria os campos específicos dentro de:

source:
runtime:
execution:
artifact:
environment:
kubernetes:

conforme o evidence_type.

A promoção correta

Em vez de:

verification PASS
       ↓
EXECUTION_TRUST = VERIFIED

eu usaria:

CONCRETE_EXECUTION_EVIDENCE
        +
RESOLVABLE_PROVENANCE
        +
ARTIFACT_BINDING
        +
RUNTIME / RESOURCE_BINDING
        +
TIME_BINDING
        +
INTEGRITY_VALID
        +
POLICY_COMPLIANT
        +
REPLAY_CAPABLE
        +
INDEPENDENT_VERIFICATION
        ↓
EXECUTION_TRUST = VERIFIED

Isso preserva a regra que você estabeleceu posteriormente:

CONCRETE_EXECUTION_EVIDENCE
        ↛
VERIFIED

A evidência de execução é necessária, mas não é suficiente sozinha.

Relação com o XA Banking CVL

A parte mais interessante do desenho original permanece válida:

XA BANKING CVL
       │
       ▼
execution_requirement
       │
       └── dependency:
             XA_TRUST_EXECUTION_ATTESTATION
                         │
                         ▼
                    evidence_id
                         │
                         ▼
                    XA-TRUST
                         │
                ┌────────┴────────┐
                ▼                 ▼
             VERIFIED            FAIL
                │                 │
                ▼                 ▼
        allow_execution      deny_execution

Mas eu acrescentaria explicitamente:

VERIFIED
    =
VERIFIED(
    claim_id,
    semantic_scope,
    execution_scope,
    evidence_id,
    bindings,
    dependencies,
    verification_policy
)

Assim, não existe um VERIFIED global do sistema.

Um NODE_IMAGE_BUILD verificado não promove automaticamente:

NODE_IMAGE_BUILD_VERIFIED
        ↛
KUBERNETES_CLUSTER_VERIFIED
        ↛
APPLICATION_EXECUTION_VERIFIED
        ↛
BANKING_DECISION_VERIFIED

Resultado arquitetural

Isso transforma o conceito original em algo mais forte:

EXECUTION TRUST SERVICE
│
├── Common Evidence Contract
│
├── Evidence Collectors
│   ├── Kubernetes
│   ├── Azure
│   ├── Node.js
│   ├── Flink
│   ├── Cloud CLI
│   └── AI Runtime
│
├── Binding Engine
├── Integrity Engine
├── Provenance Engine
├── Replay Engine
├── Policy Engine
├── Trust Assertion Engine
└── Independent Verification

E o XA Banking Core não precisa conhecer os detalhes de cada runtime.

Ele consome somente o contrato de confiança:

evidence_id
+
claim / semantic_scope
+
execution_scope
+
trust_domain
+
verification
+
trust_result

Isso é precisamente o que torna o desenho reutilizável para Kubernetes, AgentBaker, Flink, Node.js, Azure CLI e futuros runtimes de IA — sem transformar capacidade, documentação ou evidência parcial em execução verificada. um MVP específico de NODE_IMAGE_BUILD para um contrato base extensível de EXECUTION_TRUST.

Mas, à luz das invariantes XA-TRUST que você consolidou depois, eu faria uma correção fundamental: trust_result.execution_trust: VERIFIED não deve ser consequência direta de signature_validation: PASS, merkle_validation: PASS e policy_validation: PASS sem que o claim de execução esteja concretamente vinculado à execução que se pretende verificar.

Arquitetura consolidada

XA-TRUST
│
▼
EXECUTION TRUST DOMAIN
│
┌──────────┴──────────┐
│                     │
BASE EVIDENCE CONTRACT   TYPE-SPECIFIC DATA
│                     │
▼                     ▼
evidence_id             NODE_IMAGE_BUILD
evidence_type           PROCESS_EXECUTION
trust_domain            CLOUD_OPERATION_EXECUTION
provenance              STREAM_PROCESSING_EXECUTION
integrity               MODEL_EXECUTION_EVIDENCE
verification
│
└──────────┬──────────┘
▼
CLAIM / EXECUTION SCOPE
│
▼
CONCRETE EVIDENCE
│
▼
BINDING VALIDATION
│
┌─────────────────┼─────────────────┐
▼                 ▼                 ▼
ARTIFACT           RUNTIME          EXECUTION
BINDING           BINDING           BINDING
│                 │                 │
└─────────────────┼─────────────────┘
▼
INTEGRITY / PROVENANCE
│
▼
REPLAY / POLICY
│
▼
INDEPENDENT VERIFICATION
│
▼
TRUST ASSERTION

A distinção que eu congelaria

CAPABILITY
↛
ARTIFACT
↛
EVENT
↛
EXECUTION
↛
RESULT
↛
CONFORMANCE
↛
VERIFIED

Portanto, no exemplo AgentBaker:

Azure/AgentBaker
↓
commit a808d9...
↓
release metadata

estabelece proveniência/identidade de fonte observada, mas não necessariamente:

COMMIT
↛
BUILD_EXECUTED

Para NODE_IMAGE_BUILD tornar-se uma evidência de execução, você precisa do vínculo concreto entre build, artifact, ambiente e tempo.

O contrato base

Eu manteria:

evidence:
evidence_id:
evidence_type:
trust_domain: EXECUTION_TRUST

provenance:
collector:
collected_at:
schema_version:

integrity:
schema:
canonicalization:
digest:
signature:

verification:
schema_validation:
integrity_validation:
provenance_validation:
binding_validation:
replay_validation:
policy_validation:

trust_result:
execution_trust:

E deixaria os campos específicos dentro de:

source:
runtime:
execution:
artifact:
environment:
kubernetes:

conforme o evidence_type.

A promoção correta

Em vez de:

verification PASS
↓
EXECUTION_TRUST = VERIFIED

eu usaria:

CONCRETE_EXECUTION_EVIDENCE
+
RESOLVABLE_PROVENANCE
+
ARTIFACT_BINDING
+
RUNTIME / RESOURCE_BINDING
+
TIME_BINDING
+
INTEGRITY_VALID
+
POLICY_COMPLIANT
+
REPLAY_CAPABLE
+
INDEPENDENT_VERIFICATION
↓
EXECUTION_TRUST = VERIFIED

Isso preserva a regra que você estabeleceu posteriormente:

CONCRETE_EXECUTION_EVIDENCE
↛
VERIFIED

A evidência de execução é necessária, mas não é suficiente sozinha.

Relação com o XA Banking CVL

A parte mais interessante do desenho original permanece válida:

XA BANKING CVL
│
▼
execution_requirement
│
└── dependency:
XA_TRUST_EXECUTION_ATTESTATION
│
▼
evidence_id
│
▼
XA-TRUST
│
┌────────┴────────┐
▼                 ▼
VERIFIED            FAIL
│                 │
▼                 ▼
allow_execution      deny_execution

Mas eu acrescentaria explicitamente:

VERIFIED
=
VERIFIED(
claim_id,
semantic_scope,
execution_scope,
evidence_id,
bindings,
dependencies,
verification_policy
)

Assim, não existe um VERIFIED global do sistema.

Um NODE_IMAGE_BUILD verificado não promove automaticamente:

NODE_IMAGE_BUILD_VERIFIED
↛
KUBERNETES_CLUSTER_VERIFIED
↛
APPLICATION_EXECUTION_VERIFIED
↛
BANKING_DECISION_VERIFIED

Resultado arquitetural

Isso transforma o conceito original em algo mais forte:

EXECUTION TRUST SERVICE
│
├── Common Evidence Contract
│
├── Evidence Collectors
│   ├── Kubernetes
│   ├── Azure
│   ├── Node.js
│   ├── Flink
│   ├── Cloud CLI
│   └── AI Runtime
│
├── Binding Engine
├── Integrity Engine
├── Provenance Engine
├── Replay Engine
├── Policy Engine
├── Trust Assertion Engine
└── Independent Verification

E o XA Banking Core não precisa conhecer os detalhes de cada runtime.

Ele consome somente o contrato de confiança:

evidence_id
+
claim / semantic_scope
+
execution_scope
+
trust_domain
+
verification
+
trust_result

Isso é precisamente o que torna o desenho reutilizável para Kubernetes, AgentBaker, Flink, Node.js, Azure CLI e futuros runtimes de IA — sem transformar capacidade, documentação ou evidência parcial em execução verificada.
Sim. Com essa consolidação, o Execution Trust Service passa a ser uma camada transversal do XA-TRUST, e não um mecanismo específico de Kubernetes, Azure ou AgentBaker.

Eu congelaria o desenho normativo assim:

FROZEN — XA-TRUST EXECUTION TRUST DOMAIN

XA-TRUST
                            │
                            ▼
                 EXECUTION TRUST DOMAIN
                            │
              ┌─────────────┴─────────────┐
              ▼                           ▼
     COMMON EVIDENCE CONTRACT       TYPE-SPECIFIC EVIDENCE
              │                           │
              │                    ┌──────┼────────┐
              │                    ▼      ▼        ▼
              │                  K8s    Process   Cloud
              │
              ▼
       CLAIM / EXECUTION SCOPE
              │
              ▼
     CONCRETE EXECUTION EVIDENCE
              │
              ▼
       BINDING VALIDATION
              │
       ┌──────┼───────┐
       ▼      ▼       ▼
   ARTIFACT RUNTIME EXECUTION
    BINDING  BINDING   BINDING
       └──────┼───────┘
              ▼
    INTEGRITY + PROVENANCE
              │
              ▼
       REPLAY + POLICY
              │
              ▼
  INDEPENDENT VERIFICATION
              │
              ▼
       TRUST ASSERTION

Axioma de não promoção

CAPABILITY
    ↛ ARTIFACT
    ↛ EVENT
    ↛ EXECUTION
    ↛ RESULT
    ↛ CONFORMANCE
    ↛ VERIFIED

E, especificamente:

COMMIT
    ↛ BUILD_EXECUTION

BUILD_ARTIFACT
    ↛ ARTIFACT_EXECUTION

EXECUTION_EVIDENCE
    ↛ VERIFIED

VERIFIED_CLAIM
    ↛ GLOBAL_VERIFIED_STATE

O VERIFIED correto

O resultado deve ser escopado, não global:

VERIFIED(
    claim_id,
    semantic_scope,
    execution_scope,
    evidence_id,
    bindings,
    dependencies,
    verification_policy
)

Consequentemente:

NODE_IMAGE_BUILD_VERIFIED
        ↛
KUBERNETES_CLUSTER_VERIFIED
        ↛
APPLICATION_EXECUTION_VERIFIED
        ↛
BANKING_DECISION_VERIFIED

Cada promoção exige seu próprio claim e seu próprio conjunto de evidências.

Interface com o XA Banking

O XA Banking Core não precisa conhecer o mecanismo interno do runtime:

XA BANKING CORE
       │
       ▼
EXECUTION_REQUIREMENT
       │
       ▼
XA_TRUST_EXECUTION_ATTESTATION
       │
       ▼
CLAIM-SCOPED TRUST ASSERTION
       │
       ├── VERIFIED → allow
       │
       └── FAILED / INDETERMINATE → deny

Eu acrescentaria INDETERMINATE ao contrato, porque ausência ou insuficiência de evidência não deveria ser confundida com FAILED:

VERIFIED      = requisitos satisfeitos
FAILED        = requisito contradito / inválido
INDETERMINATE = evidência insuficiente ou não resolvível

Isso reforça o comportamento fail-closed.

Resultado

O modelo final fica extremamente reutilizável:

EXECUTION TRUST SERVICE
                          │
        ┌─────────────────┼─────────────────┐
        ▼                 ▼                 ▼
   COLLECTORS          VALIDATION         ASSERTION
        │                 │                 │
 ┌──────┼──────┐     ┌────┼────┐            │
 ▼      ▼      ▼     ▼    ▼    ▼            ▼
K8s   Node   Azure  Schema Integrity    VERIFIED
      Flink  AI     Binding Replay      FAILED
                                      INDETERMINATE

Assim, Kubernetes, AgentBaker, Node.js, Flink, Azure CLI e AI Runtime são apenas diferentes tipos/fontes de evidência de execução. O núcleo de confiança permanece único.

E isso produz uma fronteira arquitetural muito clara:

RUNTIME-SPECIFIC
       │
       ▼
EXECUTION EVIDENCE
       │
       ▼
XA-TRUST EXECUTION TRUST
       │
       ▼
CLAIM-SCOPED TRUST ASSERTION
       │
       ▼
XA BANKING / OTHER CONSUMER

Essa é uma formulação significativamente mais robusta para o pacote de homologação, porque permite demonstrar extensibilidade sem alegar que uma capacidade de plataforma, um commit, um artifact ou uma declaração de fornecedor constitui automaticamente uma execução verificada.


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
