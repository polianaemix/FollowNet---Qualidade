*** Settings ***
Resource                ../resource.robot
Resource                ../pages/FollowNet_capa.robot
Resource                ../pages/FollowNet_manager.robot
Test Setup              Abrir navegador
#Test Teardown           Fechar navegador

*** Test Case ***
Cenario: Cadastro de modelo
        Dado que esteja no cadastro de modelo
        Quando preencher os campos do modelo com dados válidos e confirmar
       # Então deve ser exibido o alerta " cadastrado com sucesso"

#Cenario: Exclusao de modelo
       # Dado que possua um modelo para "excluir"
       # Quando selecionar o registro e confirmar a exclusão
       # Então deve ser exibido o alerta " excluído(s) com sucesso"