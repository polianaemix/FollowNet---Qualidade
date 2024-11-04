*** Settings ***

Resource        FollowNet_capa.robot
Library         String


*** Variable ***
${grid_di_id} =         166301

*** Keywords ***
#PRE-CONDIÇÕES
Dado que esteja no FollowNet Manager
        FollowNet_capa.Dado que esteja na capa do FollowNet
        FollowNet_capa.Quando clicar no FollowNet Manager
        Então deve ser exibida a pagina do FollowNet Manager
        Capture Page Screenshot

Dado que esteja no cadastro de modelo
        Dado que esteja no FollowNet Manager


Quando preencher os campos do modelo com dados válidos e confirmar
         Unselect Frame
         Select Frame                           xpath=/html/frameset/frame[2]
         Click Element                          xpath=//*[@id="menus"]/li[3]
         Sleep                                  5s
         Click Element                          xpath=//*[@id="conteudo"]
         Click Element                          xpath=//*[@id="modelos-de-relatorio"]/table/tbody
         Click Element                          xpath=//*[@id="modelos-de-relatorio"]/table/thead/tr[1]/td/div/a
         Input Text                             id:txtNomeModelo                                  Teste Automatizacao Robot
         Select From List By Label              id:cmbModBase                                     Clientes
         Sleep                                  10s
         Select From List By Label              id:cmbTabBase                                     Cliente
         Select From List By Label              id:cmbFormatArq                                   xls
         Click Element                          xpath=/html/body/div[1]/div[2]/div[1]/div[8]/form/fieldset/div/h3[2]/a
         Wait Until Page Does Not Contain       NOBODY SELECTED
         Execute JavaScript                     $("#accordion > h3.ui-accordion-header.ui-helper-reset.ui-state-default.ui-corner-all > a").click();
         Execute JavaScript                     $("#contentColunasCampos").click();
         Click Element                          xpath=//*[@id="contentColunasCampos"]
         Wait Until Page Does Not Contain       NOBODY SELECTED
         Execute JavaScript                     $("#contentColunasCampos > ul > li > ul > li").click();
         Execute JavaScript                     $("#contentColunasCampos > ul > li > ul > li > ul > li.campo-txt.txtModulo > a").click();
         Click Element                          xpath=//*[@id="formCadModeloRel"]/fieldset
         Wait until page contains element       xpath=/html/body/div[3]
         Select From List By Label              id:Modulo                                   Clientes
         Select From List By Label              class:selected                              Filial





         #Wait Until Page Does Not Contain       NOBODY SELECTED
         #Execute JavaScript                     $("#contentColunasCampos > ul > li > ul > li > ul > li.campo-txt.txtModulo > a").click();
         #Wait Until Page Does Not Contain       NOBODY SELECTED
         #Execute JavaScript                     $("#ModuloBandeja65 > ul > li").click();
          #Execute JavaScript                    $("#ModuloBandeja1942 > ul > li").click();
         #Wait Until Page Does Not Contain       NOBODY SELECTED
         #Execute JavaScript                     $("#TabelaBandeja97121 > ul > li.selected").click();
         #Wait Until Page Does Not Contain       NOBODY SELECTED
         #Execute JavaScript                     $("#CampoBandeja50713 > ul > li.BAIRRO").click();

        # Wait Until Page Does Not Contain       NOBODY SELECTED
        # Execute JavaScript                     $("#cadastrar_0").click();


Então deve ser exibida a pagina do FollowNet Manager
        Title Should Be                         e.Mix Follow.Net: Manager
        Capture Page Screenshot