*** Settings ***
Resource                ../resource.robot
Resource                ../pages/FollowNet_capa.robot
Resource                ../pages/FollowNet_Po.robot
Test Setup              Abrir navegador
#Test Teardown           Fechar navegador

*** Test Case ***
Cenario: Cadastro de Transit time
        Dado que esteja no cadastro de processo de PO
        Quando clicar no menu transit time
        Então deve ser exibido o alerta "Transit time cadastrada com sucesso!"