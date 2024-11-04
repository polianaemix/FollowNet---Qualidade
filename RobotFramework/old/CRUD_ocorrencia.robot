*** Settings ***
Resource                ../resource.robot
Resource                ../pages/FollowNet_capa.robot
Resource                ../pages/FollowNet_grid.robot
Test Setup              Abrir navegador
#Test Teardown           Fechar navegador

*** Test Case ***
Cenario: Cadastrar uma ocorrencia
        Dado que esteja no cadastro de processo de DI
        Quando preencher os campos do DI com dados válidos e confirmar
        Então deve ser exibido o alerta "Processo cadastrado com sucesso"
        E clicar no link de Cadastrar uma ocorrencia
        E clicar no botao de Incluir uma ocorrencia e preencher os campos com dados válidos e gravar

Cenario: Alteracao de ocorrencia no processo de DI
        Dado que possua uma ocorrencia em um processo de DI para "alterar"
        Quando clicar no botao de alterar uma ocorrencia e preencher os campos com dados válidos e gravar
        Então deve ser exibido a pagina de ocorrencia alterada com sucesso

Cenario: Exclusao de ocorrencia de um processo de DI
        Dado que possua uma ocorrencia em um processo de DI para "excluir"
        Quando selecionar a ocorrencia e confirmar a exclusao
        Então deve ser exibido a mensagem de ocorrencia excluida com sucesso