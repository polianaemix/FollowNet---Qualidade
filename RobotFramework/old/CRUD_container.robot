*** Settings ***
Resource                ../resource.robot
Resource                ../pages/FollowNet_capa.robot
Resource                ../pages/FollowNet_container.robot
Test Setup              Abrir navegador
#Test Teardown           Fechar navegador

*** Test Case ***
Cenario: Cadastro de container no registro de DI
        Dado que esteja no cadastro de container
        Quando preencher os campos do container com dados validos e confirmar
        Entao deve ser exibida a mensagem "Container incluído com sucesso"

Cenario: Alteracao de container no registro de DI
        Dado que possua um container registrado para "alterar"
        Quando alterar os campos do container com dados validos e confirmar
        Entao deve ser exibida a mensagem "Container alterado com sucesso"

Cenario: Exclusao de container no registro de DI
        Dado que possua um container registrado para "excluir"
        Quando marcar o container para exclusao e confirmar
        Entao deve ser exibida a mensagem "Container excluîdo com sucesso."