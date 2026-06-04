# ❓ FAQ - Perguntas Frequentes sobre Azure AI Services

**Bootcamp DIO - Bradesco**  
**Data:** 04 de Junho de 2026

---

## 🎤 Azure AI Speech

### P: Qual é a diferença entre STT e TTS?
**R:** 
- **STT (Speech-to-Text):** Converte áudio falado em texto
- **TTS (Text-to-Speech):** Converte texto em áudio falado
- **Exemplo:** STT = microfone captura "Olá" → transforma em texto
- **Exemplo:** TTS = escreve "Olá" → sintetiza em áudio

### P: Quantos idiomas são suportados?
**R:** Azure AI Speech suporta **100+ idiomas**, incluindo:
- Português Brasileiro (pt-BR)
- Português Europeu (pt-PT)
- Espanhol, Inglês, Francês, Alemão, etc.
- Idiomas asiáticos (Chinês, Japonês, Coreano)

### P: Posso usar áudio de arquivo em vez de microfone?
**R:** Sim! Você pode usar:
- Arquivo WAV, MP3, Ogg
- Stream de áudio ao vivo
- Entrada de microfone
- Múltiplas fontes de áudio

### P: Como medir a pronúncia?
**R:** Use a feature de Avaliação de Pronúncia:
```python
# Detecta erros de pronúncia e nível de acento
pronunciation_result = client.evaluate_pronunciation(audio, reference_text)
```

### P: Qual é o custo?
**R:** Modelo "Pay-as-You-Go":
- **STT:** ~$1 por hora de áudio
- **TTS:** ~$15 por 1 milhão de caracteres
- **Reconhecimento de Locutor:** ~$1 por 1000 verificações
- Teste gratuito: 5.000 pedidos STT/mês

---

## 💬 Azure AI Language

### P: Qual é a diferença entre Sentiment e Opinião?
**R:**
- **Sentimento:** Classificação geral (Positivo, Negativo, Neutro)
- **Opinião:** Análise de aspectos específicos (produto, preço, atendimento)

### P: Suporta análise de sentimento multilíngue?
**R:** Sim! Suporta:
- Análise em 100+ idiomas
- Detecção automática de idioma
- Mistura de idiomas no mesmo texto

### P: O que é Named Entity Recognition (NER)?
**R:** Identifica pessoas, locais, organizações e quantidades:
```
Texto: "João Silva trabalha na Microsoft em São Paulo"
Entidades:
- João Silva (PERSON)
- Microsoft (ORGANIZATION)
- São Paulo (LOCATION)
```

### P: Como detectar Informações Pessoais Identificáveis (PII)?
**R:** A feature de PII Detection mascara automaticamente:
- Números de CPF/CNPJ
- Email e telefone
- Endereços
- Números de cartão de crédito

### P: Oferece suporte para análise de healthcare?
**R:** Sim! Azure AI Language for Health oferece:
- Detecção de medicações
- Diagnósticos
- Sintomas
- Procedimentos clínicos
- Extratos de prontuários

### P: Quanto custa?
**R:**
- **Análise de Sentimento:** ~$1 por 1000 registros
- **NER:** ~$1-2 por 1000 registros
- **PII Detection:** ~$2 por 1000 registros
- Teste gratuito incluído

---

## 👁️ Azure AI Vision

### P: Qual é a diferença entre Vision e Document Intelligence?
**R:**
- **Vision:** Análise geral de imagens (objetos, pessoas, cenas)
- **Document Intelligence:** Especializado em documentos (faturas, recibos, ID)

### P: Quais modelos de documentos estão disponíveis?
**R:** 9 modelos pré-construídos:
1. **Invoice** - Faturas
2. **Receipt** - Recibos
3. **ID Document** - Documentos de identidade
4. **Credit Card** - Cartões de crédito
5. **Tax Document** - Documentos fiscais
6. **Contract** - Contratos
7. **Health Insurance** - Cartões de saúde
8. **Mortgage** - Documentos hipotecários
9. **Marriage Certificate** - Certificados de casamento

### P: Posso criar modelos customizados?
**R:** Sim! Você pode treinar modelos customizados com:
- Seus próprios documentos
- Labeling manual
- Azure AI Document Intelligence Studio

### P: Funciona com imagens borradas ou de baixa qualidade?
**R:** 
- ✅ Funciona razoavelmente bem
- ⚠️ Qualidade afeta precisão
- 💡 Dica: Limpe a imagem antes de enviar

### P: Detecta faces em imagens?
**R:** Sim! Detecção inclui:
- Posição da face
- Atributos (idade aparente, gênero, emoção)
- Pose (frontal, perfil)
- Óculos, barba, etc.

### P: Quanto custa?
**R:**
- **Análise de Imagem:** ~$1 por 1000 imagens
- **OCR:** ~$1 por 1000 páginas
- **Detecção de Faces:** ~$0.10 por 1000 faces
- **Document Intelligence:** ~$0.10-0.50 por documento
- Teste gratuito: 5.000 transações

---

## 🛡️ Azure Content Safety

### P: Qual é a diferença entre moderação de texto e imagem?
**R:**
- **Texto:** Analisa palavras-chave, contexto e semântica
- **Imagem:** Usa computer vision para detectar conteúdo inadequado
- Ambos usam modelo baseado em IA

### P: Quais categorias são detectadas?
**R:**
1. **Hate** - Conteúdo discriminatório
2. **Violence** - Conteúdo violento
3. **Self-Harm** - Automutilação
4. **Sexual** - Conteúdo sexual
5. **Custom Categories** - Categorias personalizadas

### P: Como funciona a detecção de jailbreak?
**R:**
- Identifica tentativas de contornar restrições de LLMs
- Detecta prompts adversariais
- Bloqueia manipulação de modelos

### P: Posso criar categorias customizadas?
**R:** Sim! Você pode:
- Definir palavras-chave específicas
- Treinar com seus próprios dados
- Ajustar sensibilidade por categoria

### P: Oferece proteção para LLMs?
**R:** Sim! Safety Guardrails para:
- GPT-4, Llama, Mistral
- Chamadas de API
- Entrada e saída
- Jailbreak detection

### P: Qual é o custo?
**R:**
- **Moderação de Texto:** ~$1 por 1000 requisições
- **Moderação de Imagem:** ~$4 por 1000 imagens
- **Custom Categories:** ~$100/mês
- Teste gratuito incluído

---

## 🌐 Geral

### P: Posso usar Azure AI sem criar uma conta Azure?
**R:** Não. Você precisa:
1. Conta Microsoft (gratuita em outlook.com)
2. Assinatura Azure (free tier disponível)
3. Recurso criado no Azure Portal

### P: Qual é o SLA (Service Level Agreement)?
**R:**
- **Disponibilidade:** 99,9%
- **Tempo de resposta típico:** <500ms
- **Suporte:** 24/7 para issues críticos

### P: Meus dados são armazenados?
**R:**
- ✅ Processados na nuvem
- ✅ Criptografados em trânsito
- ❌ **Não** armazenados por padrão
- ⚙️ Pode configurar retenção se necessário

### P: É LGPD/GDPR compliant?
**R:** Sim!
- ✅ Conformidade total LGPD
- ✅ Conformidade total GDPR
- ✅ Documentação de privacidade
- ✅ Direito ao esquecimento

### P: Qual SDKs estão disponíveis?
**R:**
- ✅ Python
- ✅ C# / .NET
- ✅ JavaScript / Node.js
- ✅ Java
- ✅ Go
- ✅ REST API (linguagem agnóstica)

### P: Posso combinar múltiplos serviços?
**R:** Sim! Exemplos de pipeline:
```
Áudio → Speech (STT) → Text
  → Language (Sentiment) → 
  → Content Safety (Moderation) →
  → Vision (Image Analysis)
```

### P: Existe documentação em português?
**R:** 
- ✅ Microsoft Learn em pt-BR
- ✅ Exemplos de código
- ⚠️ Algumas features em inglês
- 💡 Comunidade ativa em português

### P: Como obtenho suporte?
**R:**
1. **Microsoft Learn:** learn.microsoft.com (documentação)
2. **Microsoft Q&A:** Perguntas e respostas
3. **Stack Overflow:** Tag `azure-cognitive-services`
4. **Tech Community:** Fórum Microsoft
5. **Suporte Premium:** Para assinantes

### P: Qual é a melhor forma de começar?
**R:** Recomendamos:
1. **Dia 1:** Criar conta Azure e explorar AI Studio
2. **Dia 2:** Escolher 1 serviço e ler documentação
3. **Dia 3:** Implementar primeiro exemplo com SDK
4. **Dia 4:** Integrar em pequeno projeto
5. **Dia 5+:** Explorar recursos avançados

### P: Posso testar sem custo?
**R:** Sim!
- ✅ Free tier: 5.000-20.000 transações gratuitas
- ✅ Trial de 30 dias completo
- ✅ Período de carência: não é cobrado imediatamente
- 💳 Cartão de crédito necessário para verificação

### P: Como otimizar custos?
**R:**
1. **Batch Processing:** Processe múltiplos itens por vez
2. **Cache:** Armazene resultados de análises similares
3. **Tier Certo:** Escolha plano compatível com volume
4. **Monitoramento:** Detecte uso anômalo cedo
5. **Alertas:** Configure notificações de limite

### P: Existe comunidade de desenvolvedores?
**R:** Sim!
- 🌐 [Microsoft Tech Community](https://techcommunity.microsoft.com/)
- 🤖 [Stack Overflow - Azure](https://stackoverflow.com/questions/tagged/azure)
- 💬 [Microsoft Q&A](https://learn.microsoft.com/pt-br/answers/)
- 🐙 [GitHub - Azure Samples](https://github.com/Azure-Samples)
- 🎥 [YouTube - Azure Channel](https://www.youtube.com/c/MicrosoftAzure)

---

## 📞 Próximos Passos

1. **Escolha seu serviço:** Qual mais se aplica ao seu caso?
2. **Configure credenciais:** Crie recursos no Azure
3. **Explore samples:** Veja exemplos na documentação
4. **Implemente MVP:** Crie protótipo funcional
5. **Escale:** Migre para produção com monitoramento

---

**Documento Gerado:** 04 de Junho de 2026  
**Bootcamp DIO - Bradesco**
