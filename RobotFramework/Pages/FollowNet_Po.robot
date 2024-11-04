*** Settings ***
Resource                ../resource.robot
Resource        FollowNet_capa.robot
Library         String

*** Variable ***
${grid_di_id} =         166375

*** Keywords ***
#PRE-CONDIÇÕES
Dado que esteja no FollowNet Grid
        FollowNet_capa.Dado que esteja na capa do FollowNet
        FollowNet_capa.Quando clicar no FollowNet Grid
        Então deve ser exibida a pagina do FollowNet Grid
        Capture Page Screenshot

Dado que esteja no cadastro de processo de PO
        Dado que esteja no FollowNet Grid
        Quando clicar no Grid "${grid_di_id}"
        Então deve ser exibido o Grid "${grid_di_id}"



#AÇÕES
Quando clicar no Grid "${grid_id}"
        Click Element                           //*[@id="tabela${grid_id}"]
        Capture Page Screenshot

Quando clicar no menu transit time
        Click Element                           //*[@id="menu"]/li[1]/a/i
        Click Element                           //*[@id="menuLateral166375"]/a[8]
        Switch Window                           title:Cadastro de transit time
        Title Should Be                         Cadastro de transit time
        Click Element                            xpath=/html/body/div[2]/div/div[1]/div[2]/div/a

Então deve ser exibida a pagina do FollowNet Grid
        Title Should Be                         e.Mix Follow.Net: Grid
        Select Frame                            xpath=/html/frameset/frame[2]
        Capture Page Screenshot

Então deve ser exibido o Grid "${grid_id}"
        Sleep                                   5s
        Wait Until Element Is Visible           id:grid${grid_id}_freeze_bodyDiv
        Capture Page Screenshot

Então deve ser exibido o alerta "${alerta}"
        Select From List By Label               id:comboPortoOrigem                                    AKL - New Zealand
        Select From List By Label               id:comboPortoDestino                                   ALG - Espanha
        Select From List By Label               id:comboViaTransporte                                  AEREA
        Select From List By Label               id:comboDTA                                            Sim
        Select From List By Label               id:comboCanal                                          Verde
        Page Should Contain Element             id:txtTotal
        Select From List By Label               id:comboModalidadeFrete                                STANDARD
        Title Should Be                         Cadastro de Transit Time
        Select From List By Label               id:comboTabelaBase                                     Processo DI
        Select From List By Label               id:comboCampoBase                                      Abertura (Data)
        Select From List By Label               id:comboTabelaDestino                                  Processo DI
        Select From List By Label               id:descCampoDestino                                    Alteração (Data)
        Select From List By Label               id:comboTabelaFinalizador                              Processo DI
        Select From List By Label               id:descCampoFinalizador                               1º conferência rótulo (Data)
        Select From List By Label               id:comboEtapa                                          Etapa 5 dias - 5 dias
        Click Element                           xpath=//*[@id="btnAdicionar"]
        Click Element                           xpath=/html/body/div[2]/div/div[1]/form/div[17]/div[1]/input
#VALIDA O ALERTA
        Sleep                                           2s
        Alert Should Be Present                         text=${alerta}              action=Accept