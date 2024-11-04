*** Settings ***
Resource                ../resource.robot
Resource                ../pages/FollowNet_capa.robot
Resource                ../pages/FollowNet_grid.robot
Test Setup              Abrir navegador
Test Teardown           Fechar navegador

*** Test Case ***
Cenario: Cadastro de processo de DI
        Dado que esteja no cadastro de processo de DI
        Quando preencher os campos do DI com dados válidos e confirmar
        Então deve ser exibido o alerta "Processo cadastrado com sucesso"

Cenario: Alteracao de processo de DI
        Dado que possua um processo de DI para "alterar"
        Quando preencher os campos do DI com dados válidos e salvar
        Então deve ser exibido o alerta "Alterações realizadas com sucesso."

Cenario: Exclusao de processo de DI
        Dado que possua um processo de DI para "excluir"
        Quando selecionar o registro e confirmar a exclusão
        Então deve ser exibido o alerta "Processo(s) excluído(s) com sucesso"