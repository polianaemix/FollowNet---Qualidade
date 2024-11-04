*** Settings ***
Resource                ../resource.robot

*** Variable ***
${HOME_URL}            https://testes.follownet.com.br/

*** Variable ***
${Sign-IN_FIELD_EMAIL_LOGIN}      css:input[name=username]
${Sign-IN_FIELD_SENHA_LOGIN}      css:input[name=password]
${Sign-IN_BUTTON_SUBMIT_LOGIN}    class:botao

*** Keywords ***
#PRE-CONDIÇÕES
Dado que esteja na pagina de Login
        Go To                                           ${HOME_URL}
        Title Should Be                                 e.Mix Follow.Net: e.Mix Login
        Select Frame                                    xpath=/html/frameset/frame[2]
        Capture Page Screenshot
        
#AÇÕES
Quando preencher os campos email "${e-mail}" e senha "${senha}"
        Input Text          ${Sign-IN_FIELD_EMAIL_LOGIN}        ${e-mail}
        Input Text          ${Sign-IN_FIELD_SENHA_LOGIN}        ${senha}
        Click Element       ${Sign-IN_BUTTON_SUBMIT_LOGIN}
        Capture Page Screenshot

Então deve ser exibido o nome do usuário no cabeçalho "${nomeCabecalho}"
        Sleep    6s
        Wait Until Element Is Visible               xpath=/html/body/div/table/tbody/tr[2]/td/font[2]/b                          
        Element Should Contain                      xpath=/html/body/div/table/tbody/tr[2]/td/font[2]/b         ${nomeCabecalho}
        Capture Page Screenshot