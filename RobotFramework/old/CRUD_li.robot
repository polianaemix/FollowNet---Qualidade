*** Settings ***
Resource                ../resource.robot
Resource                ../pages/FollowNet_capa.robot
Resource                ../pages/FollowNet_li.robot
Test Setup              Abrir navegador
#Test Teardown           Fechar navegador

*** Test Case ***
Cenario: Cadastro de LI no registro de DI
        Dado que esteja no cadastro de LI
        Quando preencher os campos da LI com dados validos e confirmar
        Entao deve ser exibida a mensagem "LI incluída com sucesso."
        Excluir LI

Cenario: Alteracao de LI no registro de DI
        Dado que possua uma LI registrada para "alterar"
        Quando alterar os campos da LI com dados validos e confirmar
        Entao deve ser exibida a mensagem "LI alterada com sucesso."
        Excluir LI