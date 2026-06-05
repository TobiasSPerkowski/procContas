# Processamento de Contas Bancárias em COBOL

Projeto desenvolvido com o objetivo de praticar o processamento de arquivos sequenciais, utilização de copybooks e execução de jobs em ambiente mainframe utilizando TK5/MVS.

## Objetivo

Ler um arquivo contendo registros de contas bancárias, ordená-los por agência, processar os registros, exibir os dados de cada conta e calcular estatísticas gerais.

## Funcionalidades

* Leitura de arquivo sequencial de contas bancárias.
* Utilização de Copybook para definição do layout do registro.
* Contagem do total de contas processadas.
* Soma dos saldos das contas.
* Exibição de relatório em tela.
* Ordenação do arquivo por agência através de JCL.
* Compilação e execução em ambiente TK4/MVS.

## Estrutura do Projeto

```text
procContas/
│
├── COBOL/
│   ├── BOOKCON.cpy
│   └── PROJ4.cbl
│
├── JCL/
│   ├── COMPCOB.jcl
│   └── EXECOB.jcl
│
├── Prints/
│   ├── 1.png
│   ├── 2.png
│   ├── 3.png
│   └── 4.png
│
├── CONTAS.txt
└── README.md
```

## Layout do Arquivo

Cada registro possui 54 caracteres e segue a estrutura abaixo:

| Campo           | Tamanho |
| --------------- | ------- |
| Número da Conta | 8       |
| Nome do Cliente | 30      |
| Agência         | 4       |
| Tipo de Conta   | 1       |
| Saldo           | 11      |

### Exemplo

```text
00000001JOAO SILVA                    0001C00001000000
00000002MARIA SOUZA                   0002P00002500050
```

## Arquivos do Projeto

### BOOKCON.cpy

Copybook responsável pela definição do layout do registro de conta.

### PROJ4.cbl

Programa COBOL principal responsável por:

* Ler o arquivo de contas.
* Exibir os registros processados.
* Calcular total de contas.
* Calcular saldo total.
* Exibir o resumo final.

### COMPCOB.jcl

Job responsável pela compilação programa COBOL.

### EXECOB.jcl

Job responsável pela:

1. Ordenação do arquivo de contas por agência.
2. Execução do programa COBOL utilizando o arquivo ordenado.

## Ambiente Utilizado

* GnuCOBOL (testes iniciais em Linux)
* TK5/MVS 3.8J
* x3270

## Resultado

A pasta `Prints` contém capturas de tela demonstrando:

* Submissão do JCL via TSO.
* Execução bem-sucedida do job.
* Saída produzida pelo programa.

## Autor

Tobias Saueressig
