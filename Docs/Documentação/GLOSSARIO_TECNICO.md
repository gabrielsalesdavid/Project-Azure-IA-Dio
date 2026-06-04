# 📖 Glossário Técnico - Azure AI Services

**Bootcamp DIO - Bradesco**  
**Data:** 04 de Junho de 2026

---

## A

**ACL (Access Control List)**  
Lista de controle de acesso. Define permissões para quem pode acessar um recurso na nuvem.

**API (Application Programming Interface)**  
Interface de programação. Conjunto de protocolos para comunicação entre sistemas. Azure AI oferece REST APIs e SDKs.

**Auth Token**  
Token de autenticação. Credencial temporária usada para autenticar requisições. Expira após tempo definido.

**Autoscaling**  
Dimensionamento automático. Sistema que aumenta/diminui recursos conforme demanda.

---

## B

**Batch Processing**  
Processamento em lote. Enviar múltiplos itens em uma requisição (mais eficiente que um por um).

**Bicep**  
Linguagem para Infrastructure as Code (IaC). Alternativa simplificada ao ARM Template para Azure.

**BLOB (Binary Large Object)**  
Armazenamento de dados binários grandes. Usado para imagens, vídeos, documentos.

---

## C

**Cognitive Services**  
Serviços de IA da Microsoft. Conjunto de APIs para adicionar capacidades de IA.

**Container**  
Unidade de empacotamento. Aplicação + dependências + runtime em um pacote isolado.

**CORS (Cross-Origin Resource Sharing)**  
Permite requisições de diferentes domínios. Necessário para chamadas AJAX do frontend.

**CPF (Cadastro de Pessoas Física)**  
Identificador brasileiro de pessoa física. Considerado dado pessoal sensível (PII).

**CVE (Common Vulnerabilities and Exposures)**  
Banco de dados de vulnerabilidades de segurança conhecidas.

---

## D

**Dependency Injection**  
Padrão onde dependências são "injetadas" em classes. Facilita testes e manutenção.

**Document Intelligence**  
Serviço Azure para extrair informações estruturadas de documentos (faturas, recibos, etc).

**Domain-Specific Language (DSL)**  
Linguagem criada para um domínio específico (não é linguagem geral como Python/Java).

---

## E

**Endpoint**  
Ponto de acesso da API. URL onde você envia requisições (ex: https://eastus.api.cognitive.microsoft.com/).

**Entity/Named Entity**  
Unidade de informação com significado (pessoa, lugar, organização). NER identifica essas entidades.

**Exponential Backoff**  
Estratégia de retry. Aguarda 2^n segundos entre tentativas (1s, 2s, 4s, 8s...).

---

## F

**Feature**  
Característica ou capacidade. Em ML, é uma dimensão de entrada para o modelo.

**Fallback**  
Plano alternativo. Se serviço A falhar, usar serviço B como fallback.

**Free Tier**  
Nível gratuito. Azure oferece transações grátis mensais para começar.

---

## G

**GDPR (General Data Protection Regulation)**  
Regulação europeia de proteção de dados. Exige consentimento e direito ao esquecimento.

**Geolocation**  
Localização geográfica. Azure oferece múltiplas regiões globais.

**GPU (Graphics Processing Unit)**  
Processador gráfico. Otimizado para processamento paralelo (comum em IA/ML).

---

## H

**Hallucination**  
Quando IA gera informação falsa que parece correta. Problema comum em LLMs.

**Header**  
Cabeçalho de requisição HTTP. Contém metadados (authentication, content-type, etc).

**Health Check**  
Verificação de saúde. Endpoint que valida se serviço está funcionando (status 200 = ok).

---

## I

**IaC (Infrastructure as Code)**  
Descrever infraestrutura em código. ARM Template, Bicep, Terraform são exemplos.

**IDentity Management**  
Gerenciamento de identidades. Azure AD controla quem tem acesso a quem.

**Image Analysis**  
Análise de imagens. Detecta objetos, texto, faces, cenas em imagens.

**IoT (Internet of Things)**  
Internet das Coisas. Dispositivos conectados enviando dados. Azure IoT Hub gerencia.

---

## J

**JAR (Java Archive)**  
Formato empacotado para Java. Contém classes compiladas e recursos.

**JSON (JavaScript Object Notation)**  
Formato de dados leve. Amplamente usado em APIs (alternativa a XML).

**JWT (JSON Web Token)**  
Token padronizado para autenticação. Contém informações do usuário codificadas.

---

## K

**Key Vault**  
Cofre de chaves do Azure. Armazena credenciais, chaves, segredos com segurança.

**Kubernetes**  
Orquestrador de containers. Gerencia deployment, scaling, networking de containers.

---

## L

**Language Model**  
Modelo de linguagem. Rede neural treinada em textos. Usado em tradução, resumo, etc.

**LGPD (Lei Geral de Proteção de Dados)**  
Regulação brasileira de proteção de dados. Similar ao GDPR, aplica-se no Brasil.

**LLM (Large Language Model)**  
Grande modelo de linguagem. GPT-4, Llama, Claude são exemplos.

**Load Balancing**  
Distribuição de carga. Distribui requisições entre múltiplos servidores.

---

## M

**Managed Identity**  
Identidade gerenciada pelo Azure. Simplifica autenticação sem gerenciar chaves manualmente.

**Markdown**  
Linguagem de marcação simples. Usado para documentação (como este glossário).

**Media Type / MIME Type**  
Tipo de mídia. Define formato (application/json, image/png, audio/wav, etc).

**Microsoft Learn**  
Plataforma educacional da Microsoft. Documentação, tutoriais, caminhos de aprendizado.

**Microservices**  
Arquitetura com múltiplos serviços pequenos independentes. Alternativa a monolíticos.

**Migration**  
Migração de dados/código. Mover de sistema antigo para novo.

**Mock**  
Simulação de componente para testes. Permite testar código sem dependências reais.

---

## N

**NER (Named Entity Recognition)**  
Reconhecimento de Entidades Nomeadas. Identifica pessoas, locais, organizações em texto.

**NLP (Natural Language Processing)**  
Processamento de Linguagem Natural. Campo de IA focado em entender linguagem humana.

**Notebook**  
Documento interativo (Jupyter, Azure Notebooks). Mistura código, texto, gráficos.

---

## O

**OAuth 2.0**  
Protocolo de autorização. Permite login com credenciais de terceiros (Google, Microsoft, etc).

**OCR (Optical Character Recognition)**  
Reconhecimento Óptico de Caracteres. Converte imagens de texto em texto editável.

**Ontology**  
Representação estruturada de conhecimento. Define conceitos e relações entre eles.

---

## P

**PII (Personally Identifiable Information)**  
Informação Pessoal Identificável. Dados que identificam pessoa (CPF, email, telefone, endereço).

**Pipeline**  
Fluxo de processamento. Dados passam por várias etapas (extract → transform → load).

**Prompt Engineering**  
Arte de escrever prompts efetivos para LLMs. Influencia qualidade das respostas.

**Proxy**  
Intermediário. Componente que fica entre cliente e servidor para filtrar/modificar requisições.

---

## Q

**Queue**  
Fila de mensagens. Azure Service Bus oferece fila para comunicação assíncrona entre serviços.

**Query**  
Consulta. Pedido de informação (SQL query, API query, etc).

---

## R

**REST (Representational State Transfer)**  
Estilo arquitetural para APIs. Usa HTTP com verbos (GET, POST, PUT, DELETE).

**Retry Logic**  
Lógica de repetição. Se falhar, tenta novamente. Exponential backoff comum.

**Region**  
Região geográfica do Azure. Cada região é data center separado (US East, Brazil South, etc).

**Rate Limiting**  
Limitação de taxa. Máximo de requisições por segundo/hora. Evita abuso.

---

## S

**SAS Token (Shared Access Signature)**  
Token de acesso compartilhado. Permite acesso temporário a recursos Azure sem chave.

**Scaling**  
Dimensionamento. Aumentar capacidade (vertical = CPU maior, horizontal = mais servidores).

**SDK (Software Development Kit)**  
Kit de desenvolvimento. Bibliotecas que facilitam integração com serviço (Azure SDK).

**Sentiment Analysis**  
Análise de sentimento. Determina se texto é positivo, negativo ou neutro.

**SLA (Service Level Agreement)**  
Acordo de nível de serviço. Promessa de disponibilidade/performance (ex: 99.9% uptime).

**STT (Speech-to-Text)**  
Fala para texto. Converte áudio de voz em texto escrito.

---

## T

**Tagging**  
Marcação. Adicionar labels/tags a recursos para organização e faturamento.

**TLS (Transport Layer Security)**  
Criptografia de comunicação. Substitui SSL antigo. Garante comunicação segura.

**Token**  
Credencial de autenticação. Prova que você tem permissão para acessar recurso.

**TTS (Text-to-Speech)**  
Texto para fala. Sintetiza áudio a partir de texto escrito.

---

## U

**URL (Uniform Resource Locator)**  
Endereço web. Identifica recurso na internet (ex: https://api.example.com/users).

**URI (Uniform Resource Identifier)**  
Identificador de recurso. Versão mais geral que URL (inclui URLs e URNs).

**Unsupervised Learning**  
Aprendizado sem supervisão. Modelo encontra padrões sem labels (clustering, PCA).

---

## V

**Vector**  
Vetor matemático. Representação numérica de texto/imagem/áudio. Base de embeddings.

**Versioning**  
Versionamento. Manter múltiplas versões de API, código, modelos.

**Visualization**  
Visualização. Representar dados graficamente (gráficos, tabelas, mapas).

---

## W

**Webhook**  
Hook web. Callback que é disparado quando evento acontece. Notificação push para seu serviço.

**Whitelist**  
Lista branca. IPs/usuários/recursos aprovados. Contrário de blacklist.

**Workflow**  
Fluxo de trabalho. Sequência de etapas para completar processo.

---

## X

**XML (eXtensible Markup Language)**  
Linguagem de marcação. Formato mais verboso que JSON (legível mas maior tamanho).

**XPath**  
Linguagem para navegar XML. Similar a CSS selectors para XML.

---

## Y

**YAML (YAML Ain't Markup Language)**  
Linguagem de configuração. Formato legível para humans (usado em Kubernetes, Docker Compose).

---

## Z

**Zero-Trust Security**  
Segurança sem confiança zero. Nunca confiar, sempre verificar. Exigir autenticação para tudo.

**Zone**  
Zona de disponibilidade. Múltiplas data centers redundantes em mesma região.

---

## 🔤 Abreviaturas Comuns

| Abreviatura | Significado | Contexto |
|------------|------------|---------|
| **API** | Application Programming Interface | Integração com serviços |
| **SDK** | Software Development Kit | Bibliotecas de desenvolvimento |
| **REST** | Representational State Transfer | Estilo de API |
| **JSON** | JavaScript Object Notation | Formato de dados |
| **HTTP/HTTPS** | HyperText Transfer Protocol (Secure) | Comunicação web |
| **SQL** | Structured Query Language | Banco de dados |
| **NoSQL** | Not Only SQL | Banco de dados não relacional |
| **AI** | Artificial Intelligence | Inteligência Artificial |
| **ML** | Machine Learning | Aprendizado de Máquina |
| **NLP** | Natural Language Processing | Processamento de Linguagem |
| **OCR** | Optical Character Recognition | Reconhecimento de texto |
| **STT** | Speech-to-Text | Áudio para texto |
| **TTS** | Text-to-Speech | Texto para áudio |
| **NER** | Named Entity Recognition | Identificação de entidades |
| **PII** | Personally Identifiable Information | Dados pessoais |
| **IaC** | Infrastructure as Code | Infraestrutura como código |
| **CI/CD** | Continuous Integration/Deployment | Entrega contínua |
| **JWT** | JSON Web Token | Token de autenticação |
| **CORS** | Cross-Origin Resource Sharing | Compartilhamento entre domínios |
| **RBAC** | Role-Based Access Control | Controle por papéis |

---

## 📚 Recursos de Aprendizado

- [Microsoft Learn Glossary](https://learn.microsoft.com/pt-br/)
- [Azure Documentation](https://docs.microsoft.com/pt-br/azure/)
- [GitHub Glossary](https://docs.github.com/pt/get-started/quickstart/github-glossary)
- [Tech Community - Terminology](https://techcommunity.microsoft.com/)

---

**Documento Gerado:** 04 de Junho de 2026  
**Bootcamp DIO - Bradesco**

