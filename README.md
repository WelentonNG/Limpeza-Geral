# 🧹 Windows Cleaner Pro

> Um script Batch (.BAT) para realizar limpeza e manutenção do Windows de forma rápida, segura e prática.

![Windows](https://img.shields.io/badge/Windows-10%20%7C%2011-blue)
![Batch](https://img.shields.io/badge/Language-Batch-green)
![License](https://img.shields.io/badge/License-MIT-orange)

## 📖 Sobre

O **Windows Cleaner Pro** é um script desenvolvido em **Batch (.BAT)** que automatiza diversas tarefas de limpeza do Windows, ajudando a remover arquivos temporários, caches e outros dados desnecessários que ocupam espaço em disco.

O objetivo é oferecer uma ferramenta simples, leve e gratuita, utilizando apenas recursos nativos do Windows, sem necessidade de instalar programas adicionais.

---

# ✨ Funcionalidades

### 🟢 Limpeza Rápida

* Limpeza da pasta `%TEMP%`
* Limpeza da pasta `C:\Windows\Temp`
* Limpeza do cache DNS
* Limpeza do cache de miniaturas
* Esvaziar a Lixeira

---

### 🟡 Limpeza Completa

Inclui tudo da limpeza rápida, além de:

* Cache do Windows Update
* Delivery Optimization Cache
* Cache do Google Chrome
* Cache do Microsoft Edge
* Cache do Mozilla Firefox
* Microsoft Store Cache

---

### 🔴 Limpeza Profunda

Inclui tudo da limpeza completa, além de:

* Limpeza do Prefetch
* Limpeza do Windows Defender Dynamic Signatures
* Limpeza do WinSxS
* DISM StartComponentCleanup
* Opção de executar ResetBase

---

# 🛡 Recursos

* ✅ Verificação automática de Administrador
* ✅ Menu interativo
* ✅ Interface simples
* ✅ Compatível com Windows 10 e Windows 11
* ✅ Não necessita instalação
* ✅ Utiliza apenas ferramentas nativas do Windows

---

# 📸 Menu

```text
===========================================
        WINDOWS CLEANER PRO
===========================================

1 - Limpeza Rápida

2 - Limpeza Completa

3 - Limpeza Profunda

4 - Sair
```

---

# 🚀 Como usar

1. Faça o download do arquivo `.bat`
2. Clique com o botão direito sobre ele.
3. Selecione **Executar como administrador**.
4. Escolha o tipo de limpeza desejado.

---

# ⚠ Avisos

A limpeza profunda possui uma opção chamada:

```cmd
DISM /Online /Cleanup-Image /StartComponentCleanup /ResetBase
```

Essa operação **não causa danos ao Windows**, porém impede a desinstalação de atualizações antigas do sistema.

Caso não tenha certeza, utilize apenas a opção **Limpeza Completa**.

---

# 📂 Estrutura do Projeto

```text
WindowsCleanerPro/
│
├── WindowsCleanerPro.bat
├── README.md
└── LICENSE
```

---

# 💻 Tecnologias

* Batch Script (.BAT)
* Windows CMD
* PowerShell
* DISM
* Windows Defender CLI

---

# 🎯 Objetivo

Este projeto foi criado com a finalidade de facilitar a manutenção do Windows de maneira rápida, simples e gratuita.

O foco é oferecer uma alternativa leve, sem depender de softwares de terceiros.

---

# 🤝 Contribuindo

Contribuições são bem-vindas.

Caso encontre algum problema ou tenha sugestões de melhorias:

* Abra uma Issue
* Envie um Pull Request
* Compartilhe ideias

---

# 📜 Licença

Este projeto está licenciado sob a licença **MIT**.

Sinta-se à vontade para utilizar, modificar e distribuir.

---

# 👨‍💻 Autor
Se este projeto foi útil para você, deixe uma **⭐ no repositório**. Isso ajuda bastante no crescimento do projeto e incentiva novas melhorias.
