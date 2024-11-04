*** Settings ***
Resource            FollowNet_grid.robot
Library             String

*** Variable ***
${grid_di_id} =         166301

*** Keywords ***
#PRE-CONDIÇÕES
Dado que esteja no cadastro de LI
        FollowNet_grid.Dado que esteja no cadastro de processo de DI
        FollowNet_grid.Quando preencher os campos do DI com dados válidos e confirmar
        FollowNet_grid.Então deve ser exibido o alerta "Processo cadastrado com sucesso"
        FollowNet_grid.Quando pesquisar o registro na busca
        FollowNet_grid.Então deve ser exibido o registro correspondente
        Click Element                           xpath=//*[@id="grid${grid_di_id}_freeze_bodyDiv"]/table/tbody/tr/td[2]/div/div/a[6]        
        Sleep                                   5s
        Switch Window                           title:Manutenção de LI dos Processos - FollowNet                
        Click Element                           xpath=//*[@id="formPrincipal"]/div/p/a[1]
        Wait Until Element Is Visible           xpath=//*[@id="formPrincipal"]/fieldset[1]
        Capture Page Screenshot

Dado que possua uma LI registrada para "${operacao}"
        Dado que esteja no cadastro de LI
        Quando preencher os campos da LI com dados validos e confirmar
        Entao deve ser exibida a mensagem "LI incluída com sucesso."

Quando preencher os campos da LI com dados validos e confirmar
        Press Keys                              id:cli_1                                                2126132082
        Input Text                              id:crespcustoextra_1                                    Teste automatizado Robot
        Input Text                              id:CCUSTOEXTRA_1                                        9999
        Input Text                              id:cobservacao_1                                        Teste automatizado Robot
        Select From List By Index               id:cidorgaoanuente_1                                    1
        Input Text                              id:cdivinculadaadicao_1                                 9999        
        Press Keys                              id:ccpfcancelamento_1                                   82116326087
        Select Radio Button                     ccancelado_1                                            1             
        Capture Page Screenshot
        Click Element           class:btSalvar

Quando alterar os campos da LI com dados validos e confirmar
        Click Element                           xpath=//*[@id="formPrincipal"]/div/p/a[2]
        Input Text                              id:cquantidade_1                999
        Input Text                              id:cnr_lote_1                   999
        Capture Page Screenshot
        Click Element                           class:btSalvar

Entao deve ser exibida a mensagem "${mensagem}"
        Sleep                           5s
        Page Should Contain             ${mensagem}
        Capture Page Screenshot
        Click Element                   xpath=/html/body/div/table/tbody/tr[4]/td/table/tbody/tr[5]/td/p/a/img

#Essa keyword foi criada para excluir a LI após qualquer script pois a LI não pode ser usada em mais de um registro
Excluir LI
        Click Element                   xpath=//*[@id="formPrincipal"]/div/p/a[3]
        Click Element                   id:excluir_1
        Click Element                   class:btSalvar
        Sleep                           5s
        Page Should Contain             LI excluída com sucesso.
        Capture Page Screenshot
