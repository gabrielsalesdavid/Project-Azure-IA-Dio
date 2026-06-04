@echo off
REM Script para converter HTML para PDF usando navegador
REM Compatível com Windows

echo.
echo ================================================================================
echo    CONVERSOR DE HTML PARA PDF - Azure AI Documentation
echo ================================================================================
echo.

setlocal enabledelayedexpansion

REM Diretório de documentação
set "DOCS_DIR=%~dp0Docs\Documentação"
set "CHROME_PATH=C:\Program Files\Google\Chrome\Application\chrome.exe"
set "EDGE_PATH=C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"

echo Diretório de documentação: %DOCS_DIR%
echo.

REM Verificar se os arquivos HTML existem
if not exist "%DOCS_DIR%\RESUMO_EXECUTIVO.html" (
    echo ❌ Arquivo não encontrado: RESUMO_EXECUTIVO.html
    goto :eof
)

if not exist "%DOCS_DIR%\SLIDE_RESUMO_AZURE_IA.html" (
    echo ❌ Arquivo não encontrado: SLIDE_RESUMO_AZURE_IA.html
    goto :eof
)

echo ✅ Arquivos HTML encontrados!
echo.

REM Opção 1: Tentar usar Edge (melhor suporte)
if exist "%EDGE_PATH%" (
    echo 📄 Convertendo RESUMO_EXECUTIVO.html...
    start "" "%EDGE_PATH%" --print-to-pdf="%DOCS_DIR%\RESUMO_EXECUTIVO.pdf" "%DOCS_DIR%\RESUMO_EXECUTIVO.html"
    timeout /t 5 /nobreak
    
    echo 📄 Convertendo SLIDE_RESUMO_AZURE_IA.html...
    start "" "%EDGE_PATH%" --print-to-pdf="%DOCS_DIR%\SLIDE_RESUMO_AZURE_IA.pdf" "%DOCS_DIR%\SLIDE_RESUMO_AZURE_IA.html"
    timeout /t 5 /nobreak
    
    echo.
    echo ✅ Conversão iniciada! Os PDFs serão salvos em:
    echo    %DOCS_DIR%
    echo.
    echo 💡 Nota: Feche as abas do navegador após a conversão.
    goto :end
)

REM Opção 2: Tentar usar Chrome
if exist "%CHROME_PATH%" (
    echo 📄 Convertendo RESUMO_EXECUTIVO.html...
    start "" "%CHROME_PATH%" --headless --disable-gpu --print-to-pdf="%DOCS_DIR%\RESUMO_EXECUTIVO.pdf" "%DOCS_DIR%\RESUMO_EXECUTIVO.html"
    timeout /t 5 /nobreak
    
    echo 📄 Convertendo SLIDE_RESUMO_AZURE_IA.html...
    start "" "%CHROME_PATH%" --headless --disable-gpu --print-to-pdf="%DOCS_DIR%\SLIDE_RESUMO_AZURE_IA.pdf" "%DOCS_DIR%\SLIDE_RESUMO_AZURE_IA.html"
    timeout /t 5 /nobreak
    
    echo.
    echo ✅ Conversão iniciada! Os PDFs serão salvos em:
    echo    %DOCS_DIR%
    echo.
    goto :end
)

REM Se nenhum navegador for encontrado, instruir manualmente
echo ⚠️  Navegadores não encontrados automaticamente.
echo.
echo 📋 CONVERSÃO MANUAL (Siga estes passos):
echo.
echo 1. Abra o arquivo em seu navegador:
echo    - %DOCS_DIR%\RESUMO_EXECUTIVO.html
echo    - %DOCS_DIR%\SLIDE_RESUMO_AZURE_IA.html
echo.
echo 2. Pressione Ctrl + P (ou Cmd + P no Mac)
echo.
echo 3. Clique em "Salvar como PDF"
echo.
echo 4. Escolha a pasta: %DOCS_DIR%
echo.
echo 5. Renomeie o arquivo com a extensão .pdf
echo.

:end
echo.
echo ================================================================================
echo Conversão concluída! Os PDFs estão em: %DOCS_DIR%
echo ================================================================================
echo.
pause
