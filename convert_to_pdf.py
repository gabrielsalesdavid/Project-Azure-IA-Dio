#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script para converter documentações HTML para PDF
Azure AI Services Documentation Converter
"""

import os
from pathlib import Path
from weasyprint import HTML, CSS

def convert_html_to_pdf(html_path, pdf_path):
    """
    Converte um arquivo HTML para PDF usando WeasyPrint
    
    Args:
        html_path: Caminho do arquivo HTML
        pdf_path: Caminho de saída do PDF
    """
    try:
        print(f"Convertendo: {html_path}")
        print(f"  → Destino: {pdf_path}")
        
        HTML(html_path).write_pdf(pdf_path)
        
        file_size = os.path.getsize(pdf_path) / 1024  # KB
        print(f"  ✅ Sucesso! Tamanho: {file_size:.2f} KB\n")
        return True
    except Exception as e:
        print(f"  ❌ Erro: {str(e)}\n")
        return False


def main():
    """Função principal - Converte todos os HTMLs para PDF"""
    
    # Diretório base
    base_dir = Path(__file__).parent
    docs_dir = base_dir / "Docs" / "Documentação"
    
    print("=" * 70)
    print("🔄 CONVERSOR DE DOCUMENTAÇÃO HTML PARA PDF")
    print("=" * 70)
    print(f"Diretório: {docs_dir}\n")
    
    # Lista de arquivos HTML para converter
    html_files = [
        ("RESUMO_EXECUTIVO.html", "RESUMO_EXECUTIVO.pdf"),
        ("SLIDE_RESUMO_AZURE_IA.html", "SLIDE_RESUMO_AZURE_IA.pdf"),
    ]
    
    results = {
        "sucesso": 0,
        "erro": 0,
        "arquivos": []
    }
    
    # Converter cada arquivo
    for html_name, pdf_name in html_files:
        html_path = docs_dir / html_name
        pdf_path = docs_dir / pdf_name
        
        if html_path.exists():
            success = convert_html_to_pdf(str(html_path), str(pdf_path))
            if success:
                results["sucesso"] += 1
                results["arquivos"].append({
                    "nome": pdf_name,
                    "status": "✅ Convertido"
                })
            else:
                results["erro"] += 1
                results["arquivos"].append({
                    "nome": pdf_name,
                    "status": "❌ Erro na conversão"
                })
        else:
            print(f"⚠️  Arquivo não encontrado: {html_path}\n")
            results["erro"] += 1
    
    # Resumo final
    print("=" * 70)
    print("📊 RESUMO DA CONVERSÃO")
    print("=" * 70)
    print(f"✅ Sucessos: {results['sucesso']}")
    print(f"❌ Erros: {results['erro']}")
    print(f"📁 Diretório de saída: {docs_dir}\n")
    
    print("Arquivos gerados:")
    for arquivo in results["arquivos"]:
        print(f"  • {arquivo['nome']}: {arquivo['status']}")
    
    print("\n" + "=" * 70)
    print("✨ Conversão concluída!")
    print("=" * 70)


if __name__ == "__main__":
    main()
