# 📄 Instruções - Conversão de HTML para PDF

**Como converter os arquivos HTML para PDF**

---

## ⚡ Método Rápido (Recomendado - 2 minutos)

### Passo 1: Abrir o Arquivo
1. Vá para a pasta: `Docs/Documentação/`
2. Clique com **duplo-clique** em `RESUMO_EXECUTIVO.html`
3. O arquivo abrirá no seu navegador padrão

### Passo 2: Impressão para PDF
1. Pressione **Ctrl + P** no teclado
2. Na janela de impressão:
   - **Destino:** Altere de "Impressora" para "Salvar como PDF"
   - **Formato de papel:** Mantenha A4
   - **Margens:** Clique em "Mais configurações" → Selecione "Mínimas"
   - **Cabeçalhos e rodapés:** Desmarque (opcional)

### Passo 3: Salvar
1. Clique em **"Salvar"**
2. A janela de arquivo abrirá
3. Navegue até: `Docs/Documentação/`
4. **Nome do arquivo:** `RESUMO_EXECUTIVO.pdf`
5. Clique **"Salvar"**

### Passo 4: Repetir para outro arquivo
1. Faça a mesma coisa para `SLIDE_RESUMO_AZURE_IA.html`
2. Nomeie como: `SLIDE_RESUMO_AZURE_IA.pdf`

---

## 🌐 Por Navegador

### **Google Chrome / Chromium**
```
1. Abra o arquivo HTML
2. Ctrl + P
3. Destino: "Salvar como PDF"
4. Salvar
```

### **Microsoft Edge**
```
1. Abra o arquivo HTML
2. Ctrl + P
3. Destino: "Salvar como PDF"
4. Salvar
```

### **Mozilla Firefox**
```
1. Abra o arquivo HTML
2. Ctrl + P
3. Destino: "Salvar para arquivo PDF"
4. Selecione a pasta
5. Salvar
```

### **Safari (Mac)**
```
1. Abra o arquivo HTML
2. Cmd + P
3. Clique em "Mostrar detalhes"
4. Dropdown "PDF" → "Salvar como PDF"
5. Selecione pasta e salve
```

---

## 🎨 Dicas de Formatação

### Para Melhor Resultado:

✅ **Desmarque:**
- ☐ Cabeçalhos e rodapés
- ☐ Imagens de fundo

✅ **Mantenha:**
- ✓ Cores e estilos
- ✓ Links (interativos no PDF)

✅ **Configure:**
- Margens: Mínimas (para não cortar conteúdo)
- Papel: A4
- Orientação: Retrato (Portrait)

---

## 🖥️ Verificação

Após salvar, verifique se o arquivo PDF foi criado:

```
Docs/Documentação/
├── RESUMO_EXECUTIVO.pdf          ✅ Convertido
├── SLIDE_RESUMO_AZURE_IA.pdf     ✅ Convertido
└── ... (outros arquivos)
```

---

## 💾 Abrir o PDF

1. **Duplo-clique** no arquivo PDF
2. Abre no leitor de PDF padrão
3. Pressione **Ctrl + P** para imprimir/compartilhar

---

## 🔧 Alternativas se Print-to-PDF não funcionar

### Opção 1: Uso Online (Recomendado para este caso)
1. Vá para: https://cloudconvert.com/html-to-pdf
2. Arraste o arquivo HTML
3. Clique "Convert"
4. Download do PDF

### Opção 2: Usar Extensão Chrome
1. [Instale esta extensão](https://chromewebstore.google.com/detail/save-as-pdf/kpdjmbiefmmekhimjccknbmcgidiekkd)
2. Clique na extensão enquanto vê o HTML
3. "Save as PDF"

### Opção 3: Usar Pandoc (Avançado)
```bash
# Instale Pandoc
choco install pandoc

# Converter (requer Chromium instalado)
pandoc RESUMO_EXECUTIVO.html -o RESUMO_EXECUTIVO.pdf
```

---

## 📊 Resultado Esperado

Após conversão, você terá:

| Arquivo | Tamanho Esperado | Páginas | Tipo |
|---------|-----------------|---------|------|
| **RESUMO_EXECUTIVO.pdf** | 500-800 KB | ~10 | Documento |
| **SLIDE_RESUMO_AZURE_IA.pdf** | 300-500 KB | ~7 | Slides |

---

## ❓ Dúvidas Frequentes

**P: O PDF ficou com conteúdo cortado?**  
R: Ajuste as margens para "Mínimas" na impressão.

**P: As imagens não aparecem no PDF?**  
R: Certifique-se de que "Imagens de fundo" está ativado nas configurações de impressão.

**P: Posso editar o PDF depois?**  
R: Sim, use ferramentas como:
- Adobe Acrobat Reader (edição básica)
- LibreOffice Draw (edição avançada)
- Online: https://www.ilovepdf.com/

**P: Como compartilhar o PDF?**  
R: 
- Email (anexar arquivo)
- Google Drive (upload e compartilhar)
- OneDrive
- GitHub (commit e push)

---

## 📞 Precisa de Ajuda?

Se tiver dificuldade:
1. Verifique se está usando navegador moderno (Chrome, Edge, Firefox)
2. Tente em outro navegador
3. Procure "Como salvar página como PDF" no Google
4. Consulte documentação do seu navegador

---

**Guia Criado:** 04 de Junho de 2026  
**Bootcamp DIO - Bradesco**

