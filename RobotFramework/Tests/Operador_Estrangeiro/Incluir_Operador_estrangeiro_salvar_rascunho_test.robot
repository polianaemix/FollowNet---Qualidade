*** Settings ***
Resource                ../resources/resource.robot
Resource                ../pages/FollowNet_capa.robot
Resource                ../pages/FollowNet_grid.robot
Test Setup              Abrir navegador
#Test Teardown          Fechar navegador

*** Test Case ***
Cenario: Incluir operador estrangeiro salvar rascunho
        Dado que esteja no cadastro de operador estrangeiro
        Quando preencher os campos obrigatorios
        E o sistema exibir o botão de salvar rascunho e salvar e ativar 
        E eu escolher salvar rascunho
        Então o sistema deve incluir o operador estrangeiro com status cadastral de rascunho
        
