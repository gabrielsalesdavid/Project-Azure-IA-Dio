# 🚀 Guia de Implementação Prática - Azure AI Services

**Bootcamp DIO - Bradesco**  
**Data:** 04 de Junho de 2026  
**Versão:** 1.0

---

## 📋 Índice

1. [Pré-requisitos](#pré-requisitos)
2. [Configuração Inicial](#configuração-inicial)
3. [Implementação do Azure AI Speech](#implementação-do-azure-ai-speech)
4. [Implementação do Azure AI Language](#implementação-do-azure-ai-language)
5. [Implementação do Azure AI Vision](#implementação-do-azure-ai-vision)
6. [Implementação do Azure Content Safety](#implementação-do-azure-content-safety)
7. [Boas Práticas](#boas-práticas)
8. [Troubleshooting](#troubleshooting)

---

## 🔧 Pré-requisitos

### Necessário para Desenvolvimento:

```bash
✅ Conta Microsoft/Azure (gratuita ou paga)
✅ SDK do seu linguagem preferida instalado
✅ Editor de código (VS Code recomendado)
✅ Git para controle de versão
✅ Terminal/PowerShell com acesso à internet
```

### Ambientes Recomendados:

| Linguagem | Versão Mínima | Gerenciador Pacotes |
|-----------|---------------|---------------------|
| **Python** | 3.8+ | pip, conda, poetry |
| **C#** | .NET 6+ | NuGet, dotnet CLI |
| **JavaScript/TypeScript** | Node 14+ | npm, yarn |
| **Java** | 11+ | Maven, Gradle |

---

## ⚙️ Configuração Inicial

### 1. Criar Recurso no Azure

```bash
# Via Portal Azure (ai.azure.com)
1. Login com conta Microsoft
2. Clique em "Create new project"
3. Escolha a região (ex: East US, Brazil South)
4. Selecione o serviço desejado
5. Clique em "Create"
```

### 2. Obter Credenciais

```bash
# No Azure Portal:
1. Vá para "Keys and endpoints"
2. Copie:
   - API Key (chave de autenticação)
   - Endpoint (URL da API)
3. Armazene com segurança em .env
```

### 3. Variáveis de Ambiente

```bash
# Windows PowerShell
$env:AZURE_SPEECH_KEY="sua-chave-aqui"
$env:AZURE_SPEECH_REGION="eastus"
$env:AZURE_LANGUAGE_KEY="sua-chave-aqui"
$env:AZURE_VISION_KEY="sua-chave-aqui"

# Linux/Mac
export AZURE_SPEECH_KEY="sua-chave-aqui"
export AZURE_SPEECH_REGION="eastus"
export AZURE_LANGUAGE_KEY="sua-chave-aqui"
export AZURE_VISION_KEY="sua-chave-aqui"

# .env (não commitar ao Git!)
AZURE_SPEECH_KEY=sua-chave-aqui
AZURE_SPEECH_REGION=eastus
AZURE_LANGUAGE_KEY=sua-chave-aqui
AZURE_VISION_KEY=sua-chave-aqui
```

---

## 🎤 Implementação do Azure AI Speech

### Instalação

```bash
# Python
pip install azure-cognitiveservices-speech

# C#
dotnet add package Microsoft.CognitiveServices.Speech

# JavaScript/Node.js
npm install microsoft-cognitiveservices-speech-sdk

# Java
mvn dependency:tree | grep -i speech
<!-- Adicione ao pom.xml -->
<dependency>
    <groupId>com.microsoft.cognitiveservices.speech</groupId>
    <artifactId>client-sdk</artifactId>
    <version>1.38.0</version>
</dependency>
```

### Exemplo: Speech-to-Text (Python)

```python
import azure.cognitiveservices.speech as speechsdk
import os
from dotenv import load_dotenv

load_dotenv()

# Configurar credenciais
speech_key = os.getenv('AZURE_SPEECH_KEY')
speech_region = os.getenv('AZURE_SPEECH_REGION')

speech_config = speechsdk.SpeechConfig(
    subscription=speech_key,
    region=speech_region
)

# Configurar idioma e formato de saída
speech_config.speech_recognition_language = "pt-BR"

# Usar microfone como entrada
audio_config = speechsdk.AudioConfig(use_default_microphone=True)

# Criar reconhecedor
speech_recognizer = speechsdk.SpeechRecognizer(
    speech_config=speech_config,
    audio_config=audio_config
)

print("Fale algo...")
speech_recognition_result = speech_recognizer.recognize_once()

if speech_recognition_result.reason == speechsdk.ResultReason.RecognizedSpeech:
    print(f"Reconhecido: {speech_recognition_result.text}")
elif speech_recognition_result.reason == speechsdk.ResultReason.NoMatch:
    print("Nenhuma fala detectada")
elif speech_recognition_result.reason == speechsdk.ResultReason.Canceled:
    print(f"Erro: {speech_recognition_result.cancellation_details.error_details}")
```

### Exemplo: Text-to-Speech (C#)

```csharp
using Microsoft.CognitiveServices.Speech;
using System;

class Program
{
    static void Main(string[] args)
    {
        var speechConfig = SpeechConfig.FromSubscription(
            Environment.GetEnvironmentVariable("AZURE_SPEECH_KEY"),
            Environment.GetEnvironmentVariable("AZURE_SPEECH_REGION")
        );
        
        // Configurar idioma
        speechConfig.SpeechSynthesisLanguage = "pt-BR";
        
        // Usar alto-falante padrão
        var audioConfig = AudioConfig.FromDefaultSpeakerOutput();
        
        var synthesizer = new SpeechSynthesizer(speechConfig, audioConfig);
        
        string text = "Olá! Este é um teste de síntese de fala.";
        var result = synthesizer.SpeakTextAsync(text).Result;
        
        if (result.Reason == ResultReason.SynthesizingAudioCompleted)
        {
            Console.WriteLine("Síntese concluída!");
        }
        else
        {
            Console.WriteLine($"Erro: {result.ErrorDetails}");
        }
    }
}
```

---

## 💬 Implementação do Azure AI Language

### Instalação

```bash
# Python
pip install azure-ai-textanalytics

# C#
dotnet add package Azure.AI.TextAnalytics

# JavaScript
npm install @azure/ai-text-analytics

# Java
<dependency>
    <groupId>com.azure</groupId>
    <artifactId>azure-ai-textanalytics</artifactId>
    <version>5.3.0</version>
</dependency>
```

### Exemplo: Análise de Sentimento (Python)

```python
from azure.ai.textanalytics import TextAnalyticsClient
from azure.core.credentials import AzureKeyCredential
import os
from dotenv import load_dotenv

load_dotenv()

# Configurar cliente
endpoint = f"https://{os.getenv('AZURE_LANGUAGE_REGION')}.tagger.cognitiveservices.azure.com/"
key = os.getenv('AZURE_LANGUAGE_KEY')

client = TextAnalyticsClient(endpoint=endpoint, credential=AzureKeyCredential(key))

# Texto para análise
documents = [
    "Adorei este produto! Excelente qualidade e entrega rápida.",
    "Péssima experiência. O produto chegou quebrado.",
    "É ok, nada de especial."
]

# Realizar análise de sentimento
response = client.analyze_sentiment(
    documents=documents,
    language="pt-BR"
)

for document in response:
    print(f"Sentimento: {document.sentiment}")
    print(f"Pontuação Positiva: {document.confidence_scores.positive}")
    print(f"Pontuação Negativa: {document.confidence_scores.negative}")
    print(f"Pontuação Neutra: {document.confidence_scores.neutral}")
    print("---")
```

### Exemplo: Reconhecimento de Entidades Nomeadas (JavaScript)

```javascript
const { TextAnalyticsClient, AzureKeyCredential } = require("@azure/ai-text-analytics");

const endpoint = process.env.AZURE_LANGUAGE_ENDPOINT;
const key = process.env.AZURE_LANGUAGE_KEY;

const client = new TextAnalyticsClient(endpoint, new AzureKeyCredential(key));

async function analyzeEntities() {
    const documents = [
        "João Silva trabalha na Microsoft em São Paulo desde 2020."
    ];

    const results = await client.recognizeEntities(documents, "pt-BR");

    for (const result of results) {
        console.log("Entidades detectadas:");
        for (const entity of result.entities) {
            console.log(`  - ${entity.text} (${entity.category})`);
        }
    }
}

analyzeEntities().catch(err => console.error(err));
```

---

## 👁️ Implementação do Azure AI Vision

### Instalação

```bash
# Python
pip install azure-cognitiveservices-vision-computervision

# C#
dotnet add package Azure.AI.Vision.ImageAnalysis

# JavaScript
npm install @azure/cognitiveservices-vision-computervision

# Java
<dependency>
    <groupId>com.azure</groupId>
    <artifactId>azure-cognitiveservices-vision-computervision</artifactId>
    <version>1.0.0</version>
</dependency>
```

### Exemplo: Análise de Imagem (Python)

```python
from azure.cognitiveservices.vision.computervision import ComputerVisionClient
from azure.cognitiveservices.vision.computervision.models import VisualFeatureTypes
from msrest.authentication import CognitiveServicesCredentials
import os

# Configurar cliente
key = os.getenv('AZURE_VISION_KEY')
endpoint = os.getenv('AZURE_VISION_ENDPOINT')

client = ComputerVisionClient(
    endpoint=endpoint,
    credentials=CognitiveServicesCredentials(key)
)

# URL de imagem para análise
image_url = "https://example.com/image.jpg"

# Features para análise
features = [
    VisualFeatureTypes.description,
    VisualFeatureTypes.faces,
    VisualFeatureTypes.objects,
    VisualFeatureTypes.text
]

# Realizar análise
results = client.analyze_image_by_url(image_url, features)

# Exibir resultados
print("Descrição:", results.description.captions[0].text)
print(f"Faces detectadas: {len(results.faces)}")
print("Objetos detectados:")
for obj in results.objects:
    print(f"  - {obj.object_property} ({obj.confidence:.2%})")
```

### Exemplo: OCR - Reconhecimento de Texto (C#)

```csharp
using Azure;
using Azure.AI.Vision.ImageAnalysis;
using System;
using System.IO;

string subscriptionKey = Environment.GetEnvironmentVariable("AZURE_VISION_KEY");
string endpoint = Environment.GetEnvironmentVariable("AZURE_VISION_ENDPOINT");

var client = new ImageAnalysisClient(
    new Uri(endpoint),
    new AzureKeyCredential(subscriptionKey)
);

// Ler imagem do arquivo
using FileStream imageData = new FileStream("documento.png", FileMode.Open, FileAccess.Read);

ImageAnalysisOptions options = new ImageAnalysisOptions()
{
    Features = ImageAnalysisFeatures.Text
};

ImageAnalysisResult result = client.Analyze(imageData, ImageAnalysisFeatures.Text, options);

Console.WriteLine("Texto reconhecido:");
foreach (var block in result.Text.Blocks)
{
    foreach (var line in block.Lines)
    {
        Console.WriteLine(line.Content);
    }
}
```

---

## 🛡️ Implementação do Azure Content Safety

### Instalação

```bash
# Python
pip install azure-ai-contentsafety

# C#
dotnet add package Azure.AI.ContentSafety

# JavaScript
npm install @azure/ai-content-safety

# Java
<dependency>
    <groupId>com.azure</groupId>
    <artifactId>azure-ai-contentsafety</artifactId>
    <version>1.0.0</version>
</dependency>
```

### Exemplo: Moderação de Texto (Python)

```python
from azure.ai.contentsafety import ContentSafetyClient
from azure.ai.contentsafety.models import TextModerationRequest
from azure.core.credentials import AzureKeyCredential
import os

client = ContentSafetyClient(
    endpoint=os.getenv('AZURE_CONTENTSAFETY_ENDPOINT'),
    credential=AzureKeyCredential(os.getenv('AZURE_CONTENTSAFETY_KEY'))
)

# Texto para moderação
request = TextModerationRequest(text="Seu texto para análise aqui...")

# Executar moderação
response = client.analyze_text(request)

# Exibir resultados
print(f"Hate Speech Score: {response.hate_result.severity}")
print(f"Violence Score: {response.violence_result.severity}")
print(f"Self-Harm Score: {response.self_harm_result.severity}")
print(f"Sexual Score: {response.sexual_result.severity}")

# Severidade: 0 (safe) a 7 (não seguro)
if response.hate_result.severity >= 5:
    print("⚠️ Conteúdo prejudicial detectado!")
```

---

## ✅ Boas Práticas

### 1. Segurança

```bash
✅ Nunca commita chaves no Git
✅ Use Azure Key Vault para armazenar credenciais
✅ Implemente rate limiting
✅ Valide todas as entradas
✅ Use HTTPS para todas as comunicações
✅ Ative logging e monitoring
✅ Implemente retry logic com exponential backoff
```

### 2. Performance

```python
# ❌ Ruim - requisição lenta
def process_text(text):
    # Uma requisição por palavra
    for word in text.split():
        result = client.analyze_sentiment([word])

# ✅ Bom - batch processing
def process_text(text):
    # Uma requisição para todos
    result = client.analyze_sentiment(text.split(), batch_size=10)
```

### 3. Error Handling

```python
from azure.core.exceptions import (
    ResourceNotFoundError,
    HttpResponseError,
    ServiceResponseError
)

try:
    result = client.analyze_sentiment(documents)
except ResourceNotFoundError:
    print("Recurso não encontrado")
except HttpResponseError as e:
    print(f"Erro HTTP: {e.status_code} - {e.message}")
except ServiceResponseError as e:
    print(f"Erro de serviço: {e}")
```

### 4. Logging

```python
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

logger.info(f"Analisando: {len(documents)} documentos")
logger.debug(f"Configuração: {config}")
logger.warning("Taxa de limite próxima")
logger.error("Falha ao processar documento", exc_info=True)
```

### 5. Testing

```python
import unittest
from unittest.mock import patch, MagicMock

class TestAzureIntegration(unittest.TestCase):
    @patch('azure.ai.textanalytics.TextAnalyticsClient')
    def test_sentiment_analysis(self, mock_client):
        # Mock da resposta
        mock_client.analyze_sentiment.return_value = [
            {"sentiment": "positive", "score": 0.95}
        ]
        
        # Testar sua função
        result = analyze_sentiment("Texto de teste")
        self.assertEqual(result["sentiment"], "positive")
```

---

## 🔧 Troubleshooting

### Erro: "Invalid Subscription Key"

```
✅ Solução:
1. Verifique se a chave está correta
2. Confirme se a chave não expirou
3. Verifique se está usando a região correta
4. Regenere a chave no Azure Portal se necessário
```

### Erro: "Endpoint is invalid"

```
✅ Solução:
1. Copie o endpoint correto do Azure Portal
2. Certifique-se que inclui https://
3. Verifique o formato: https://[region].api.cognitive.microsoft.com/
```

### Erro: "Rate Limit Exceeded"

```
✅ Solução:
1. Implemente retry logic com backoff exponencial
2. Use batch processing
3. Aumente o plano de pricing
4. Distribua requisições ao longo do tempo

# Exemplo de retry:
import time
from azure.core.exceptions import HttpResponseError

def retry_with_backoff(func, max_retries=3):
    for attempt in range(max_retries):
        try:
            return func()
        except HttpResponseError as e:
            if e.status_code == 429:  # Rate limit
                wait_time = 2 ** attempt  # Exponential backoff
                print(f"Taxa limitada. Aguardando {wait_time}s...")
                time.sleep(wait_time)
            else:
                raise
    raise Exception("Máximo de tentativas atingido")
```

### Erro: "Unsupported Language"

```
✅ Solução:
1. Verifique idiomas suportados na documentação oficial
2. Use código de idioma correto (ex: pt-BR, not pt)
3. Alguns serviços têm idiomas limitados

# Idiomas comuns:
- pt-BR (Português Brasileiro)
- en-US (English US)
- es-ES (Spanish)
- fr-FR (French)
```

---

## 📚 Recursos Adicionais

- [Azure SDK Documentation](https://learn.microsoft.com/pt-br/azure/developer/python/sdk/)
- [Code Samples](https://github.com/Azure-Samples)
- [REST API Reference](https://learn.microsoft.com/pt-br/rest/api/cognitiveservices/)

---

**Documento Gerado:** 04 de Junho de 2026  
**Bootcamp DIO - Bradesco**
