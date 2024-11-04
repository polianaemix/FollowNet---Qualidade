*** Settings ***
Resource                ../resource.robot
Resource                ../pages/FollowNet_capa.robot
Resource                ../pages/FollowNet_grid.robot
Resource                ../Pages/Follownet_cg.robot
Test Setup              Abrir navegador
#Test Teardown           Fechar navegador

*** Test Case ***
Cenario: Cadastro de uma planilha simples no carga de dados
        Dado que esteja no cadastro da planilha do carga de dados
        Quando preencher os campos da tela de carga de dados com dados válidos e confirmar
        Então deve ser exibido o alerta "Processo cadastrado com sucesso"