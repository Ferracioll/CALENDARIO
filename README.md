# CALENDÁRIO 📆  
### Nesse projeto, realizei um calendário em `.bat`, onde criei pastas pertencentes ao ano, mês específico e dia.  

---  

### O diferencial desse código é que integrei um sistema que analisa se o ano digitado é bissexto, e se for, muda automaticamente o dia do mês **Fevereiro** (único afetado pelo ano bissexto).

<div align="center">  
<img src="https://s2-oglobo.glbimg.com/Iq8inDgVwvx3yu96Xs8dkceDOQo=/600x0/filters:quality(50)/https://i.s3.glbimg.com/v1/AUTH_da025474c0c44edd99332dddb09cabe8/internal_photos/bs/2023/i/A/6u6EsXRwWBiBfAgse3NA/whatsapp-image-2023-12-31-at-07.34.57.jpeg">  
</div>  
<div align="center"> Calendário bissexto </div>  

---  

## O QUE APRENDI 🧠  
### Agora, irei explicar alguns comandos que aprendi enquanto realizava esse projeto:

>`%1 e %2` Descobri que esse comando classifica os parâmetros por ordem. Exemplo - digitei 111 e 222 - %1 é 111 e %2 é 222.  
>`set /a "resto=%1 + 4"` Nessa linha, defini uma variável e atribuí uma conta a ela (%1 + 4).  
>`If e Else` Apesar de conhecer essa definição, precisei aprender como atribuí-la para definir se o ano é bissexto ou não.  
>`if "%2" == "2" set dias=%dias_fevereiro%` Aqui defini que se o segundo parâmetro for igual a 2 (fevereiro), defino os dias igual à variável **dias_fevereiro**, que não possui valor fixo, pois muda de acordo com o ano.  
>`for /l %%i in (1,1,%dias%) do (` Nesse trecho, defini um loop para automatizar a criação das pastas dias de acordo com o mês. Exemplo, se o mês for 2, será adicionado automaticamente 28 ou 29 pastas dentro do mesmo.  

<br>  

## DEFINIÇÃO BISSEXTO 🗓️  
### O diferencial do meu código é como ele trata se o ano é bissexto, indicado logo abaixo:

```bat
set /a "resto=%1 %% 4"
set /a "resto100=%1 %% 100"
set /a "resto400=%1 %% 400"
set /a "conta = %1+4"
if %resto%==0 (
    if %resto100%==0 (
        if %resto400%==0 (
            set dias_fevereiro=29
        ) else (
            set dias_fevereiro=28
            echo num eh
        )
    ) else (
        set dias_fevereiro=29
        echo o proximo ano bissexto e %conta%
    )
) else (
    set dias_fevereiro=28
    echo num eh
)

if "%2" == "2" set dias=%dias_fevereiro%

```
# EXPLICANDO O CÓDIGO 💻

```bat
@echo off

if %2 gtr 12 (
    echo O mes deve ser um numero entre 1 e 12
    exit /b
)

if not exist "%1" (
    mkdir "%1"
)

set /a "resto=%1 %% 4"
set /a "resto100=%1 %% 100"
set /a "resto400=%1 %% 400"
set /a "conta = %1+4"

if %resto%==0 (
    if %resto100%==0 (
        if %resto400%==0 (
            set dias_fevereiro=29
        ) else (
        set dias_fevereiro=28
        echo num eh
        )
    ) else (
        set dias_fevereiro=29
        echo o proximo ano bissexto e %conta%
    )
) else (
    set dias_fevereiro=28
    echo num eh
)

cd "%1"

if not exist "%2" (
    mkdir "%2"
)

cd "%2"
```

#### Nessa parte, garanti que qualquer coisa que for diferente de 1 a 12 no parametro %2 seja incorreta, assim garantido a "segurança do código". Logo após, defini que se não existir uma pasta já existente com o mesmo nome do parametro 1, o código deve cria-la, e o mesmo com o parametro 2. Por ultimo, defini as condições para um ano bissexto, que expliquei no tópico acima.
<br>

```bat
if "%2" == "1" set dias=31
if "%2" == "2" set dias=%dias_fevereiro%
if "%2" == "3" set dias=31
if "%2" == "4" set dias=30
if "%2" == "5" set dias=31
if "%2" == "6" set dias=30
if "%2" == "7" set dias=31
if "%2" == "8" set dias=31
if "%2" == "9" set dias=30
if "%2" == "10" set dias=31
if "%2" == "11" set dias=30
if "%2" == "12" set dias=31

echo o numero de dias do mes %2 e %dias%

for /l %%i in (1,1,%dias%) do (
    if not exist "Dia %%i" (
        mkdir "Dia %%i"
    )
)

cd ..
cd ..

```
#### Na segunda parte do código, defini a quantidade de dias para cada mês, criando uma variavel **Dias** na mesma linha, com apenas um diferencial no mês de **Fevereiro** aonde cirei outra variável chamada **dias_fevereiro** que vai mudar se o ano for bissexto ou não. Por ultimo, criei um loop para garantir e automatizar a criação de pastas **dias**, alem de criar uma condição, adicionando as pastas caso não existir.

<br>
<br>

---
# MELHORIAS 😄

### Apesar de não conhecer muito da area da programação e no que pode ser feito para otimizar o código, consigo apontar um "problema" que pode ser otimizado, e ele se localiza nesse trecho:

```bat
if "%2" == "1" set dias=31
if "%2" == "2" set dias=%dias_fevereiro%
if "%2" == "3" set dias=31
if "%2" == "4" set dias=30
if "%2" == "5" set dias=31
if "%2" == "6" set dias=30
if "%2" == "7" set dias=31
if "%2" == "8" set dias=31
if "%2" == "9" set dias=30
if "%2" == "10" set dias=31
if "%2" == "11" set dias=30
if "%2" == "12" set dias=31

```
### Consegui analisar de deduzir que talvez conseguimos diminuir algumas linhas, ja que alguns meses possui a mesma quantidade de dias, assim criando 2 "listas", as dos meses que possuem 30 dias, e a dos meses que possuem 31 dias, (exceto por **fevereiro**, que possui 28 dias apenas)

---

# CONSIDERAÇÕES FINAIS 🏆

### Acredito que esse projeto me ajudou muito, principalmente a entender como desenvolver as condições necessárias para desafios específicos, como neste caso do ano bissexto. Além disso, mesmo sem querer, ele me ajudou a trabalhar em equipe, pois, ao sermos apresentados a um desafio complexo, nos unimos e criamos juntos esse código que expliquei acima.
