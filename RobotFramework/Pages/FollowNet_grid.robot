*** Settings ***
Resource                ../resource.robot
Resource        FollowNet_capa.robot
Library         String

*** Variable ***
${grid_di_id} =         166301

*** Keywords ***
#PRE-CONDIÇÕES
Dado que esteja no FollowNet Grid
        FollowNet_capa.Dado que esteja na capa do FollowNet
        FollowNet_capa.Quando clicar no FollowNet Grid
        Então deve ser exibida a pagina do FollowNet Grid
        Capture Page Screenshot

Dado que esteja no FollowNet Mais Opções
        FollowNet_capa.Dado que esteja na capa do FollowNet
        FollowNet_capa.Quando clicar no FollowNet Mais Opções
        Capture Page Screenshot

Dado que esteja no cadastro de operador estrangeiro
        Dado que esteja no FollowNet Mais Opções
        Quando clicar no novo grid
        Então deve ser exibido o Grid "${grid_di_id}"
        E clicar no Botão "xpath=//*[@id="menu"]/li[9]/a"
        Então deve ser exibido o popup de cadastro de processo da DI
        Capture Page Screenshot

Dado que esteja no cadastro de processo de DI
        Dado que esteja no FollowNet Grid
        Quando clicar no Grid "${grid_di_id}"
        Então deve ser exibido o Grid "${grid_di_id}"
        E clicar no Botão "xpath=//*[@id="menu"]/li[9]/a"
        Então deve ser exibido o popup de cadastro de processo da DI
        Capture Page Screenshot
#

Dado que esteja no modulo de DI
        Dado que esteja no FollowNet Grid
        Quando clicar no Grid "${grid_di_id}"
        Então deve ser exibido o Grid "${grid_di_id}"


Dado que possua um processo de DI para "${operacao}"
        Dado que esteja no cadastro de processo de DI
        Quando preencher os campos do DI com dados válidos e confirmar
        Então deve ser exibido o alerta "Processo cadastrado com sucesso"
        Quando pesquisar o registro na busca
        Então deve ser exibido o registro correspondente
        Capture Page Screenshot

Dado que possua uma ocorrencia em um processo de DI para "${operacao}"
      Dado que esteja no cadastro de processo de DI
      Quando preencher os campos do DI com dados válidos e confirmar
      Então deve ser exibido o alerta "Processo cadastrado com sucesso"
      E clicar no link de Cadastrar uma ocorrencia
      E clicar no botao de Incluir uma ocorrencia e preencher os campos com dados válidos e gravar

Dado que esteja na inclusão de processo no grid de DI
        Dado que esteja no FollowNet Grid
        Quando clicar no Grid "${grid_di_id}"
        Então deve ser exibido o Grid "${grid_di_id}"
        E clicar no Botão "xpath=//*[@id="menu"]/li[12]/a"
        Então deve ser exibido o popup de inclusão de processo
        Capture Page Screenshot

Dado que esteja na configuração de colunas de DI
        Dado que esteja no FollowNet Grid
        Quando clicar no Grid "${grid_di_id}"
        Então deve ser exibido o Grid "${grid_di_id}"
        Quando clicar em configurar colunas
        Então deve ser exibida a página de selecionar colunas
        Capture Page Screenshot

Dado que tenha um processo de DI para "${operacao}" e feito upload do arquivo "${FILE}"
        Dado que possua um processo de DI para "${operacao}"
        Quando clicar no link de upload do processo
        Então dever ser o upload do arquivo "${FILE}"

#AÇÕES

Quando clicar no novo grid
        Click Element    btn-default
        Capture Page Screenshot

Quando clicar no Grid "${grid_id}"
        Click Element                           //*[@id="tabela${grid_id}"]
        Capture Page Screenshot

Quando preencher os campos do DI com dados válidos e confirmar
        ${registro} =  Generate Random String  8  [NUMBERS]
        Set Global Variable                     ${registro}
        Input Text                              id:txtRegistro                  ${registro}
        #Select From List By Label               id:ddlTpServico                 Assembly
        #Select From List By Label               id:ddlEmbarqueTerceiro          Não
        Select From List By Label               id:ddlCodCli                    3M DO BRASIL - 45.985.371/0033-95
        Select From List By Label               id:ddlCodViaTransp              MARITIMA
        Select From List By Label               id:ddlFilial                    Campinas
        #Select From List By Label               id:ddlCelula                    e.Mix
        Click Element                           id:btnSalvar
        Capture Page Screenshot

Quando pesquisar o registro na busca
        Sleep                   8s
        Input Text              xpath=//*[@id="f_value${grid_di_id}"]                ${registro}
      #  Capture Page Screenshot

Quando preencher os campos do DI com dados válidos e salvar
        #TEXTO
        Click Element                           xpath=/html/body/div[2]/div[2]/div/div[1]/div[2]/table/tbody/tr/td[3]/div/span
        Input Text                              xpath=/html/body/div[2]/div[2]/div/div[1]/div[2]/div/input              Teste       
        #COMBO
        Click Element                           xpath=/html/body/div[2]/div[2]/div/div[1]/div[2]/table/tbody/tr[1]/td[5]/div/span
        Wait Until Element Is Visible           xpath=//*[@id="ddlColumnSelected"]/option[2]
        Click Element                           xpath=//*[@id="ddlColumnSelected"]/option[2]
        Click Element                           xpath=//*[@id="grid_follow${grid_di_id}_dialogEditor_undefined"]
        #BOOLEAN
        Click Element                           xpath=/html/body/div[2]/div[2]/div/div[1]/div[2]/table/tbody/tr/td[6]/div/span
        Click Element                           xpath=/html/body/div[2]/div[2]/div/div[1]/div[2]/div/select
        Wait Until Element Is Visible           xpath=//*[@id="grid${grid_di_id}_bodyDiv"]/div/select/option[3]
        Click Element                           xpath=//*[@id="grid${grid_di_id}_bodyDiv"]/div/select/option[3]
        #CLICA FORA DOS CAMPOS
        Click Element                           xpath=//*[@id="grid${grid_di_id}_bodyDiv"]
        #SALVAR
        Click Element                           xpath=//*[@id="menu"]/li[11]/a
        Capture Page Screenshot

Quando selecionar o registro e confirmar a exclusão
        Wait Until Element Is Visible           id:grid${grid_di_id}_freeze_bodyDiv
        ${target} =                             Get WebElement          xpath:.//tr[contains(., '${registro}')]
        #Should Contain                          ${target.text}           ${registro}
        Table Row Should Contain                class:gt-table          1                ${registro}
        Click Element                           class:gt-col-grid${grid_di_id}-registro
        Click Element                           xpath=//*[@id="menu"]/li[10]/a
        Select Frame                            xpath=//*[@id="divExcluirProcessoFrame"]/iframe
        Wait Until Element Is Visible           id:lblAlerta
        Element Should Contain                  id:lblAlerta            Esta ação excluirá o(s) processo(s):
        Click Element                           id:btnSim
        Capture Page Screenshot


Quando clicar no botao de alterar uma ocorrencia e preencher os campos com dados válidos e gravar
      #  Capture Page Screenshot
        Click Element                           xpath=/html/body/div/table/tbody/tr[4]/td/table/tbody/tr[5]/td/p/a/img
        Click Element                           xpath=//*[@id="formPrincipal"]/div/p/a[2]
        # data
        #Click Element                           xpath=//*[@id="formPrincipal"]/fieldset[1]/ul[1]/li[1]/a[1]
        #Select From List By Label               id:ccodoco_1                                     AGUARDANDO TROCA DE B/L
        Select From List By Label               id:cidetapa_1                                    Chegada x Presença Teste
        Input Text                              id:cobservacao_1                                 Teste Automatizacao Robot 2
        Input Text                              id:canalisecausaraiz_1                           Teste Automatizacao Robot Causa Raiz 2
        Input Text                              id:cacaocorretivaatomar_1                        Teste Automatizacao Robot 2
        Input Text                              id:cacaopreventivaatomar_1                       Teste Automatizacao Robot 2
        # data
        Click Element                           xpath=//*[@id="formPrincipal"]/fieldset[1]/ul[1]/li[8]/a[1]
        Click Element                           xpath=//*[@id="formPrincipal"]/fieldset[1]/ul[1]/li[9]/a[1]
        Select From List By Label               id:cresponsabilidadeoco_1                        Agente de carga
        #radio
        Select Radio Button                     cmostracli_1                                     0
        Select Radio Button                     cacaocorretiva_1                                 1
        Input Text                              id:crespacaocorretiva_1                          Teste Automatizacao Robot 2
        #radio
        Select Radio Button                     cacaopreventiva_1                                0
        Input Text                              id:crespacaopreventiva_1                         Teste Automatizacao Robot 2
        Select From List By Label               id:cperiodonaoconformidade_1                     Antes do desembaraço
        Select From List By Label               id:cverifeficacia_1                              Comprovada
        Input Text                              id:cobsverifeficacia_1                           Teste Automatizacao Robot 2
        #data
        Click Element                           xpath=//*[@id="formPrincipal"]/fieldset[1]/ul[1]/li[19]/a[1]
        Select From List By Label               id:crespverifeficacia_1                          Test Robot Framework
        #data
        Click Element                           xpath=//*[@id="formPrincipal"]/fieldset[1]/ul[1]/li[21]/a[1]
        Click Element                           xpath=//*[@id="formPrincipal"]/fieldset[1]/ul[1]/li[22]/a[1]
        Click Element                           xpath=//*[@id="formPrincipal"]/fieldset[1]/ul[1]/li[23]/a[1]
        Input Text                              id:assunto_email_1                               test.robot.fn@emix.com.br
        Select From List By Label               id:assunto_campo_1                               Tipo de ocorrência
        Click Element                           xpath=//*[@id="cidetapa_1"]
        #radio
        Select Radio Button                     cenviarhistorico_1                               2

Quando buscar por um processo e adicioná-lo ao grid
        Select From List By Label               id:ddlFiltro                            HAWB/HBL
        Input Text                              id:txtValor                             Teste
        Click Element                           id:btnBuscar
        Sleep                                   2s
        Click Element                           id:grvDI_chkSelecionado_0
        Capture Page Screenshot
        ${processo} =                           Get Text                xpath=//*[@id="grvDI"]/tbody/tr[2]/td[2]
        Set Global Variable                     ${processo}
        Click Element                           id:btnAddDI

Quando selecionar a ocorrencia e confirmar a exclusao
        Click Element                           xpath=/html/body/div/table/tbody/tr[4]/td/table/tbody/tr[5]/td/p/a/img
        Click Element                           xpath=//*[@id="formPrincipal"]/div/p/a[3]
        Select Checkbox                         xpath=//*[@id="excluir_1"]

Quando clicar em configurar colunas
        Sleep                                   2s
        Click Element                           xpath=//*[@id="menu"]/li[50]/a
        Sleep                                   2s
        Click Element                           xpath=//*[@id="menu"]/li[50]/ul/li[2]/a





Quando marcar uma coluna para exibir e confirmar a alteração        
        Click Element                           xpath=/html/body/div[2]/div[7]/form/fieldset/table/tbody/tr[6]/td[3]/input[1]
        Capture Page Screenshot
        ${coluna} =                             Get Text                                xpath=/html/body/div[2]/div[7]/form/fieldset/table/tbody/tr[6]/td[1]
        Set Global Variable                     ${coluna}        
        Click Element                           class:salvarGrid
        Sleep                                   2s
        Alert Should Be Present                 text=Essas alterações somente entrarão em vigor quando a página for recarregada, deseja recarregar agora?            action=Accept
        Unselect Frame
        Select Frame                            xpath=/html/frameset/frame[2]

Quando ocultar uma coluna e confirmar a alteração        
        Click Element                           xpath=/html/body/div[2]/div[7]/form/fieldset/table/tbody/tr[6]/td[3]/input[1]
        Capture Page Screenshot
        ${coluna} =                             Get Text                                xpath=/html/body/div[2]/div[7]/form/fieldset/table/tbody/tr[6]/td[1]
        Set Global Variable                     ${coluna}        
        Click Element                           class:salvarGrid
        Sleep                                   2s
        Alert Should Be Present                 text=Essas alterações somente entrarão em vigor quando a página for recarregada, deseja recarregar agora?            action=Accept
        Unselect Frame
        Select Frame                            xpath=/html/frameset/frame[2]

Quando clicar no link de upload do processo
     #  Capture Page Screenshot
        Wait Until Element Is Visible           id:grid${grid_di_id}_freeze_bodyDiv
        ${target} =                             Get WebElement          xpath:.//tr[contains(., '${registro}')]
       #Should Contain                          ${target.text}           ${registro}
        Table Row Should Contain                class:gt-table          1                ${registro}
        Click Element                           xpath=//*[@id="grid${grid_di_id}_freeze_bodyDiv"]/table/tbody/tr/td[2]/div/div/a[4]/i
        Switch Window                           title:e.Mix Follow.Net: Upload
       #Capture Page Screenshot

Quando clicar no link de download do arquivo
        Title Should Be                         e.Mix Follow.Net: Upload
        Wait Until Element Is Visible           xpath=/html/body/div/div[2]/table
        #Click Link                              xpath=/html/body/div/div[2]/table/tbody/tr/td[8]/a/i
       #Checkbox Should Be Selected             xpath=/html/body/div/div[2]/table/tbody/tr/th/input
     #   ${target} =                             Get WebElement          xpath:.//tr[contains(., '${registro}')]
        Table Row Should Contain                class:hide         1                    arquivo
        #Checkbox Should Be Selected             xpath=/html/body/div/div[2]/table/tbody/tr/th/input
        Wait Until Page Does Not Contain        NOBODY SELECTED
        Execute JavaScript                      $("#conteudo > table > tbody > tr > td.abrir.alignCenter > a > i").click();

        #Table Column Should Contain             class:hide               1
        #Click Element                           xpath=/html/body/div/div[2]/table/tbody/tr/td[8]
      #  ${coluna} =                             Get Text                                xpath=/html/body/div/div[2]/table/tbody/tr/td[8]
       # Set Global Variable                     ${coluna}
       # Click Element                           xpath=//*[@id="conteudo"]/table/tbody/tr/td[8]/a/i
       #Switch Window                           title:e.Mix Follow.Net: Upload

Quando clicar no link de log do processo, o mesmo será exibido
     #  Capture Page Screenshot
        Wait Until Element Is Visible           id:grid${grid_di_id}_freeze_bodyDiv
        ${target} =                             Get WebElement          xpath:.//tr[contains(., '${registro}')]
       #Should Contain                          ${target.text}           ${registro}
        Table Row Should Contain                class:gt-table          1                ${registro}
        Click Element                           xpath=//*[@id="grid${grid_di_id}_freeze_bodyDiv"]/table/tbody/tr/td[2]/div/div/a[7]/i
       #Capture Page Screenshot

Quando clicar no link de valores processo, o mesmo será exibido
     #  Capture Page Screenshot
        Wait Until Element Is Visible           id:grid${grid_di_id}_freeze_bodyDiv
        ${target} =                             Get WebElement          xpath:.//tr[contains(., '${registro}')]
       #Should Contain                          ${target.text}           ${registro}
        Table Row Should Contain                class:gt-table          1                ${registro}
        Click Element                           xpath=//*[@id="grid${grid_di_id}_freeze_bodyDiv"]/table/tbody/tr/td[2]/div/div/a[9]/i
       #Capture Page Screenshot

Quando clicar no menu relatorios

        Wait Until Element Is Visible           id:grid${grid_di_id}_freeze_bodyDiv
        Click Element                           xpath=//*[@id="menu"]/li[8]/a
        Click Element                           xpath=//*[@id="menuLateral166301"]/a[3]
        Switch Window                           title:FollowNet - Alteração de registros
        Title Should Be                         FollowNet - Alteração de registros
        Select From List By Label               id:ddlModulo                              DI - Desembaraço Importação


E clicar no Botão "${grid_button_incluir}"
        Click Element                           ${grid_button_incluir}

E clicar no link de Cadastrar uma ocorrencia
      #  Capture Page Screenshot
        Wait Until Element Is Visible           id:grid${grid_di_id}_freeze_bodyDiv
        ${target} =                             Get WebElement          xpath:.//tr[contains(., '${registro}')]
        #Should Contain                          ${target.text}           ${registro}
        Table Row Should Contain                class:gt-table          1                ${registro}
        Click Element                           xpath=//*[@id="grid${grid_di_id}_freeze_bodyDiv"]/table/tbody/tr[1]/td[2]/div/div/a[3]/i
        Switch Window                           title:Desembaraço Importação - Manutenção de Ocorrencias dos Processos - FollowNet
        #Capture Page Screenshot


E clicar no botao de Incluir uma ocorrencia e preencher os campos com dados válidos e gravar
                Capture Page Screenshot
                Click Element                           xpath=//*[@id="formPrincipal"]/div/p/a
                # data
                Click Element                           xpath=//*[@id="formPrincipal"]/fieldset[1]/ul[1]/li[1]/a[1]
                Select From List By Label               id:ccodoco_1                                     AGUARDANDO TROCA DE B/L
                Select From List By Label               id:cidetapa_1                                    Chegada x Presença Teste
                Input Text                              id:cobservacao_1                                 Teste Automatizacao Robot
                Input Text                              id:canalisecausaraiz_1                           Teste Automatizacao Robot Causa Raiz
                Input Text                              id:cacaocorretivaatomar_1                        Teste Automatizacao Robot
                Input Text                              id:cacaopreventivaatomar_1                       Teste Automatizacao Robot
                # data
                Click Element                           xpath=//*[@id="formPrincipal"]/fieldset[1]/ul[1]/li[8]/a[1]
                Click Element                           xpath=//*[@id="formPrincipal"]/fieldset[1]/ul[1]/li[9]/a[1]
                Select From List By Label               id:cresponsabilidadeoco_1                        Agente de carga
                #radio
                Select Radio Button                     cmostracli_1                                     0
                Select Radio Button                     cacaocorretiva_1                                 1
                Input Text                              id:crespacaocorretiva_1                          Teste Automatizacao Robot
                #radio
                Select Radio Button                     cacaopreventiva_1                                0
                Input Text                              id:crespacaopreventiva_1                         Teste Automatizacao Robot
                Select From List By Label               id:cperiodonaoconformidade_1                     Antes do desembaraço
                Select From List By Label               id:cverifeficacia_1                              Comprovada
                Input Text                              id:cobsverifeficacia_1                           Teste Automatizacao Robot
                #data
                Click Element                           xpath=//*[@id="formPrincipal"]/fieldset[1]/ul[1]/li[19]/a[1]
                Select From List By Label               id:crespverifeficacia_1                          Test Robot Framework
                #data
                Click Element                           xpath=//*[@id="formPrincipal"]/fieldset[1]/ul[1]/li[21]/a[1]
                Click Element                           xpath=//*[@id="formPrincipal"]/fieldset[1]/ul[1]/li[22]/a[1]
                Click Element                           xpath=//*[@id="formPrincipal"]/fieldset[1]/ul[1]/li[23]/a[1]
                Input Text                              id:assunto_email_1                               test.robot.fn@emix.com.br
                Select From List By Label               id:assunto_campo_1                               Tipo de ocorrência
                Click Element                           xpath=//*[@id="cidetapa_1"]
                #radio
                Select Radio Button                     cenviarhistorico_1                               2
                Click Element                           xpath=//*[@id="btn-submit-oco"]
              #  Click Element                           xpath=/html/body/div/table/tbody/tr[4]/td/table/tbody/tr[5]/td/p/a/img
              #  Click Element                           xpath=//*[@id="formPrincipal"]/fieldset[3]/a[2]
                #Capture Page Screenshot

Então deve ser exibida a modal com mais opções de funcionalidade
     Capture Page Screenshot

Então deve ser exibida a pagina do FollowNet Grid
        Title Should Be                         e.Mix Follow.Net: Grid
        Select Frame                            xpath=/html/frameset/frame[2]
        Capture Page Screenshot

Então deve ser exibido o Grid "${grid_id}"
        Sleep                                   8s
        Wait Until Element Is Visible           id:grid${grid_id}_freeze_bodyDiv
        Capture Page Screenshot

Então deve ser exibido o popup de cadastro de processo da DI
        Select Frame                            xpath=//*[@id="divIncluirProcessoFrame"]/iframe
        Wait Until Element Is Visible           id:lblAbertura
        Element Should Contain                  id:lblAbertura         Data de Abertura

Então deve ser exibido o alerta "${alerta}"
        #VALIDA O ALERTA
        Sleep                                           2s
        Alert Should Be Present                         text=${alerta}              action=Accept
        Unselect Frame
        Select Frame                                    xpath=/html/frameset/frame[2]
        #BUSCA O REGISTRO
        Sleep                                           8s
        Input Text                                      xpath=//*[@id="f_value${grid_di_id}"]                ${registro}
        Sleep                                           5s
        Capture Page Screenshot

Então deve ser exibido o registro correspondente
        ${target} =                             Get WebElement          xpath:.//tr[contains(., '${registro}')]
        Sleep                                   8s
        #Should Contain                          ${target.text}          ${registro}
        Table Row Should Contain                class:gt-table          1               ${registro}
        Capture Page Screenshot

Então deve ser exibido a pagina de ocorrencia alterada com sucesso
        Click Element                           xpath=//*[@id="btn-submit-oco"]
      #  Click Element                           xpath=/html/body/div/table/tbody/tr[4]/td/table/tbody/tr[5]/td/p/a/img
        Capture Page Screenshot

Então deve ser exibido o popup de inclusão de processo
        Select Frame                            xpath=//*[@id="divIncluirRegistroFrame"]/iframe
        Wait Until Element Is Visible           id:Label1
        Element Should Contain                  id:Label1            Processo(s) que já estão listados no grid, não aparecerão nesta pesquisa.

Então deve ser exibido o processo correspondente no grid
        Unselect Frame
        Select Frame                            xpath=/html/frameset/frame[2]
        Sleep                                   5s
        Input Text                              xpath=//*[@id="f_value${grid_di_id}"]                   ${processo}
        ${target} =                             Get WebElement                                          xpath:.//tr[contains(., '${processo}')]
        Table Row Should Contain                class:gt-table                          1               ${processo}
        Capture Page Screenshot

Então deve ser exibido a mensagem de ocorrencia excluida com sucesso
        Click Element                           xpath=//*[@id="btn-submit-oco"]

Então dever ser o upload do arquivo "${FILE}"
        Select Frame                          xpath=/html/frameset/frame[2]
        Sleep                                 5s
        Click Link                            xpath=//*[@id="conteudo"]/table/thead/tr[1]/td/a[1]
        Wait Until Element Is Visible         FU_enviar
        Choose File                           FU_arquivo                                                ${FILE}
        Select From List By Label             id:FU_tipo                                                Acordos
        Click Button                          FU_enviar
        Click Element                         xpath=//*[@id="form_upload"]/div/fieldset/a/i

Então deve ser exibida a página de selecionar colunas
        Sleep                                   5s
        Wait Until Element Is Visible           class:configurar_grid                   60s
        Element Should Contain                  class:configurar_grid                   SELECIONAR COLUNAS
        Wait Until Element Is Visible           class:form_configurar_grid              60s

Então a coluna deve ser exibida no grid de DI               
        Quando clicar no Grid "${grid_di_id}"
        Então deve ser exibido o Grid "${grid_di_id}"
        Click Element                           xpath=//*[@id="f_fieldName${grid_di_id}"]
        Element Should Contain                  xpath=//*[@id="f_fieldName${grid_di_id}"]               ${coluna}
        Capture Page Screenshot

Então a coluna deve ser ocultada no grid de DI
        Quando clicar no Grid "${grid_di_id}"
        Então deve ser exibido o Grid "${grid_di_id}"  
        Click Element                           xpath=//*[@id="f_fieldName${grid_di_id}"]
        Element Should Not Contain              xpath=//*[@id="f_fieldName${grid_di_id}"]               ${coluna}      
        Capture Page Screenshot


Entao deve ser preenchido as informacoes e gerado o relatorio de DI
        Title Should Be                         FollowNet - Alteração de registros
        Wait Until Element Is Visible           xpath=//*[@id="Label1"]
        Select From List By Label               id:DFDESIMPRELAT                                 Relatório de Valores
        Select From List By Label               id:DFDESIMPPERIODO                               Entregues
        Input Text                              id:DFDESIMPDATAINI                               28031997
        Input Text                              id:DFDESIMPDATAFIM                               28031997
        Select From List By Label               id:DFDESIMPFILTRO                                Não Embarcados
        Select From List By Label               id:DFDESIMPORDEM                                 Data de Chegada
        Select From List By Label               id:DFDESIMPCLI                                   15.254.015/0001-53 - 15.254.015/0001-53
        Select From List By Label               id:DFDESIMPTRADING                               importador - 44.363.661/0005-80
        Select From List By Label               id:CURFDESPAC_DI                                 0927600 - AEROPORTO DE FLORIANOPOLIS (CóDIGO ANTIGO - USE O
        Select From List By Label               id:DFDESIMPVIATRANSPORTE                         COURIER
        Select From List By Label               id:DFDESIMPTIPDESP                               ADMISSAO EM ALC - AREA DE LIVRE COMERCIO
        Select From List By Label               id:DFDESIMPCANAL                                 CINZA
        Select From List By Label               id:DFDESIMPFILIAL                                Caxias do Sul
        Select From List By Label               id:DFDESIMPNIVELURGENCIA                         Urgente
        Click Element                           xpath=//*[@id="btnRelatorio"]
