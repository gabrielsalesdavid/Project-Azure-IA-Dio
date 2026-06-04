# 💻 Exemplos de Código - Azure AI Services

**Bootcamp DIO - Bradesco**  
**Data:** 04 de Junho de 2026

---

## 🐍 Python

### Speech-to-Text com Arquivo

```python
import azure.cognitiveservices.speech as speechsdk
import os

# Configurar
speech_key = os.getenv('AZURE_SPEECH_KEY')
speech_region = os.getenv('AZURE_SPEECH_REGION')

speech_config = speechsdk.SpeechConfig(
    subscription=speech_key,
    region=speech_region
)
speech_config.speech_recognition_language = "pt-BR"

# Usar arquivo em vez de microfone
audio_config = speechsdk.AudioConfig(filename="audio.wav")

# Reconhecer
recognizer = speechsdk.SpeechRecognizer(
    speech_config=speech_config,
    audio_config=audio_config
)

result = recognizer.recognize_once()

if result.reason == speechsdk.ResultReason.RecognizedSpeech:
    print(f"✅ Reconhecido: {result.text}")
elif result.reason == speechsdk.ResultReason.NoMatch:
    print("❌ Nenhuma fala detectada")
```

### Análise de Sentimento Batch

```python
from azure.ai.textanalytics import TextAnalyticsClient
from azure.core.credentials import AzureKeyCredential

endpoint = f"https://brazilsouth.tagger.cognitiveservices.azure.com/"
key = os.getenv('AZURE_LANGUAGE_KEY')

client = TextAnalyticsClient(endpoint=endpoint, credential=AzureKeyCredential(key))

# Múltiplos documentos
documents = [
    "Adorei este produto! Excelente!",
    "Péssimo, não funciona.",
    "É ok, atende minhas necessidades."
]

result = client.analyze_sentiment(documents, language="pt-BR")

for doc, response in zip(documents, result):
    print(f"Texto: {doc}")
    print(f"Sentimento: {response.sentiment}")
    print(f"Scores - Pos: {response.confidence_scores.positive:.2%}, "
          f"Neg: {response.confidence_scores.negative:.2%}, "
          f"Neu: {response.confidence_scores.neutral:.2%}")
    print()
```

### NER - Extrair Entidades

```python
from azure.ai.textanalytics import TextAnalyticsClient
from azure.core.credentials import AzureKeyCredential

client = TextAnalyticsClient(endpoint=endpoint, credential=AzureKeyCredential(key))

document = "João Silva trabalha na Microsoft em São Paulo desde 2020."

entities_result = client.recognize_entities([document], language="pt-BR")[0]

print("Entidades encontradas:")
for entity in entities_result.entities:
    print(f"  • {entity.text:15} | {entity.category:12} | Confiança: {entity.confidence_score:.2%}")
```

### Análise de Imagem

```python
from azure.cognitiveservices.vision.computervision import ComputerVisionClient
from azure.cognitiveservices.vision.computervision.models import VisualFeatureTypes
from msrest.authentication import CognitiveServicesCredentials

key = os.getenv('AZURE_VISION_KEY')
endpoint = os.getenv('AZURE_VISION_ENDPOINT')

client = ComputerVisionClient(endpoint=endpoint, credentials=CognitiveServicesCredentials(key))

# Analisar imagem de URL
image_url = "https://raw.githubusercontent.com/Azure-Samples/cognitive-services-sample-data-files/master/ComputerVision/Images/landmark.jpg"

features = [VisualFeatureTypes.description, VisualFeatureTypes.faces, VisualFeatureTypes.objects]

results = client.analyze_image_by_url(image_url, features)

print("Descrição:", results.description.captions[0].text)
print(f"Faces: {len(results.faces)}")
for obj in results.objects:
    print(f"  Objeto: {obj.object_property} ({obj.confidence:.0%})")
```

---

## 🔷 C# / .NET

### Speech Translation

```csharp
using Microsoft.CognitiveServices.Speech;
using Microsoft.CognitiveServices.Speech.Translation;
using System;

var speechConfig = SpeechConfig.FromSubscription(
    Environment.GetEnvironmentVariable("AZURE_SPEECH_KEY"),
    Environment.GetEnvironmentVariable("AZURE_SPEECH_REGION")
);

var translationConfig = SpeechTranslationConfig.FromSubscription(
    Environment.GetEnvironmentVariable("AZURE_SPEECH_KEY"),
    Environment.GetEnvironmentVariable("AZURE_SPEECH_REGION")
);

translationConfig.SpeechRecognitionLanguage = "pt-BR";
translationConfig.AddTargetLanguage("en");
translationConfig.AddTargetLanguage("es");

var audioConfig = AudioConfig.FromDefaultMicrophoneInput();
var recognizer = new TranslationRecognizer(translationConfig, audioConfig);

Console.WriteLine("Fale algo...");
var result = recognizer.RecognizeOnceAsync().Result;

if (result.Reason == ResultReason.TranslatedSpeech)
{
    Console.WriteLine($"Detectado: {result.Text}");
    Console.WriteLine($"Inglês: {result.Translations["en"]}");
    Console.WriteLine($"Espanhol: {result.Translations["es"]}");
}
```

### Text Summarization

```csharp
using Azure;
using Azure.AI.TextAnalytics;

var client = new TextAnalyticsClient(
    new Uri(Environment.GetEnvironmentVariable("AZURE_LANGUAGE_ENDPOINT")),
    new AzureKeyCredential(Environment.GetEnvironmentVariable("AZURE_LANGUAGE_KEY"))
);

string document = @"
O Microsoft Azure é uma plataforma de computação em nuvem com mais de 200 serviços.
Oferece soluções para computação, análise, armazenamento, networking e muito mais.
É usado por empresas de todos os tamanhos em todo o mundo.
";

AbstractiveSummaryOperation operation = client.AbstractiveExtractiveSummarization(
    new[] { document },
    language: "pt-BR",
    options: new AbstractiveSummaryOptions()
);

await operation.WaitForCompletionAsync();

var summaryResult = operation.Value.First();
Console.WriteLine("Resumo gerado:");
foreach (var summary in summaryResult.Summaries)
{
    Console.WriteLine(summary.Text);
}
```

### OCR - Extrair Texto

```csharp
using Azure;
using Azure.AI.Vision.ImageAnalysis;

var client = new ImageAnalysisClient(
    new Uri(Environment.GetEnvironmentVariable("AZURE_VISION_ENDPOINT")),
    new AzureKeyCredential(Environment.GetEnvironmentVariable("AZURE_VISION_KEY"))
);

// Do arquivo
using FileStream imageData = new FileStream("documento.png", FileMode.Open);
var result = client.Analyze(imageData, ImageAnalysisFeatures.Text);

Console.WriteLine("Texto extraído:");
foreach (var block in result.Text.Blocks)
{
    foreach (var line in block.Lines)
    {
        Console.WriteLine($"  {line.Content}");
    }
}
```

---

## 🟨 JavaScript / TypeScript / Node.js

### Speech Recognition (Browser)

```javascript
const speechConfig = SpeechSDK.SpeechConfig.fromSubscription(
    process.env.AZURE_SPEECH_KEY,
    process.env.AZURE_SPEECH_REGION
);

const audioConfig = SpeechSDK.AudioConfig.fromDefaultMicrophoneInput();
const recognizer = new SpeechSDK.SpeechRecognizer(speechConfig, audioConfig);

recognizer.recognizeOnceAsync(result => {
    if (result.reason === SpeechSDK.ResultReason.RecognizedSpeech) {
        console.log(`Recognized: ${result.text}`);
    } else if (result.reason === SpeechSDK.ResultReason.NoMatch) {
        console.log("No speech could be recognized.");
    }
    recognizer.close();
});
```

### Sentiment Analysis

```javascript
const { TextAnalyticsClient, AzureKeyCredential } = require("@azure/ai-text-analytics");

const client = new TextAnalyticsClient(
    process.env.AZURE_LANGUAGE_ENDPOINT,
    new AzureKeyCredential(process.env.AZURE_LANGUAGE_KEY)
);

async function analyzeSentiment() {
    const [result] = await client.analyzeSentiment(
        ["Este produto é excelente! Recomendo fortemente."],
        "pt-BR"
    );

    console.log(`Sentimento geral: ${result.sentiment}`);
    console.log(`Confiança positiva: ${(result.confidenceScores.positive * 100).toFixed(2)}%`);
    console.log(`Confiança negativa: ${(result.confidenceScores.negative * 100).toFixed(2)}%`);
}

analyzeSentiment().catch(err => console.error(err));
```

### Document Analysis

```javascript
const { DocumentAnalysisClient, AzureKeyCredential } = require("@azure/ai-form-recognizer");

const client = new DocumentAnalysisClient(
    process.env.AZURE_VISION_ENDPOINT,
    new AzureKeyCredential(process.env.AZURE_VISION_KEY)
);

async function analyzeInvoice() {
    const poller = await client.beginAnalyzeDocumentFromUrl(
        "prebuilt-invoice",
        "https://example.com/invoice.pdf"
    );

    const result = await poller.pollUntilDone();

    console.log("Campos da fatura:");
    for (const [key, value] of Object.entries(result.fields)) {
        console.log(`${key}: ${value.value}`);
    }
}

analyzeInvoice().catch(err => console.error(err));
```

---

## ☕ Java

### Speech-to-Text

```java
import com.microsoft.cognitiveservices.speech.*;

public class Main {
    public static void main(String[] args) throws Exception {
        SpeechConfig speechConfig = SpeechConfig.fromSubscription(
            System.getenv("AZURE_SPEECH_KEY"),
            System.getenv("AZURE_SPEECH_REGION")
        );
        
        speechConfig.setSpeechRecognitionLanguage("pt-BR");
        
        SpeechRecognizer recognizer = new SpeechRecognizer(speechConfig);
        
        System.out.println("Fale algo...");
        SpeechRecognitionResult result = recognizer.recognizeOnceAsync().get();
        
        if (result.getReason() == ResultReason.RecognizedSpeech) {
            System.out.println("Reconhecido: " + result.getText());
        } else if (result.getReason() == ResultReason.NoMatch) {
            System.out.println("Nenhuma fala detectada.");
        }
    }
}
```

### Text Analytics - Language Detection

```java
import com.azure.ai.textanalytics.*;
import com.azure.core.credential.AzureKeyCredential;

public class LanguageDetectionExample {
    public static void main(String[] args) {
        TextAnalyticsClient client = new TextAnalyticsClientBuilder()
            .endpoint(System.getenv("AZURE_LANGUAGE_ENDPOINT"))
            .credential(new AzureKeyCredential(System.getenv("AZURE_LANGUAGE_KEY")))
            .buildClient();

        String document = "Olá, como você está?";
        DetectedLanguage detectedLanguage = client.detectLanguage(document);
        
        System.out.println("Idioma detectado: " + detectedLanguage.getName());
        System.out.println("Código: " + detectedLanguage.getIso6391Name());
        System.out.println("Confiança: " + detectedLanguage.getConfidenceScore());
    }
}
```

---

## 🔧 Padrões Comuns

### Error Handling (Python)

```python
from azure.core.exceptions import HttpResponseError, ServiceResponseError
import time

def retry_with_exponential_backoff(func, max_retries=3):
    for attempt in range(max_retries):
        try:
            return func()
        except HttpResponseError as e:
            if e.status_code == 429:  # Rate limit
                wait_time = 2 ** attempt
                print(f"Rate limited. Waiting {wait_time}s...")
                time.sleep(wait_time)
            else:
                raise
        except ServiceResponseError as e:
            print(f"Service error: {e}")
            raise

# Uso
try:
    result = retry_with_exponential_backoff(
        lambda: client.analyze_sentiment(documents)
    )
except Exception as e:
    print(f"Erro final: {e}")
```

### Batch Processing (C#)

```csharp
var documents = new List<string> { /* ... */ };
var batchSize = 10;

for (int i = 0; i < documents.Count; i += batchSize)
{
    var batch = documents.Skip(i).Take(batchSize).ToList();
    var results = client.AnalyzeSentiment(batch, language: "pt-BR");
    
    foreach (var result in results)
    {
        ProcessResult(result);
    }
}
```

### Async/Await Pattern (JavaScript)

```javascript
async function processDocuments(documents) {
    try {
        const results = await Promise.all(
            documents.map(doc => client.analyzeSentiment([doc], "pt-BR"))
        );
        
        return results;
    } catch (error) {
        console.error("Erro ao processar:", error);
        throw error;
    }
}
```

---

## 📚 Repositórios com Exemplos

- [Azure Samples - AI Services](https://github.com/Azure-Samples?q=ai)
- [Azure SDK Python Examples](https://github.com/Azure/azure-sdk-for-python/tree/main/sdk)
- [Azure SDK JavaScript Examples](https://github.com/Azure/azure-sdk-for-js/tree/main/sdk)
- [Azure SDK Java Examples](https://github.com/Azure/azure-sdk-for-java/tree/main/sdk)
- [Azure SDK .NET Examples](https://github.com/Azure/azure-sdk-for-net/tree/main/sdk)

---

**Documento Gerado:** 04 de Junho de 2026  
**Bootcamp DIO - Bradesco**

