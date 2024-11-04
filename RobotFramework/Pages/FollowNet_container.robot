*** Settings ***
Resource        FollowNet_grid.robot
Library         String

*** Variable ***
${grid_di_id} =         166301

*** Keywords ***
#PRE-CONDIÇÕES
Dado que esteja no cadastro de container
        FollowNet_grid.Dado que esteja no cadastro de processo de DI
        FollowNet_grid.Quando preencher os campos do DI com dados válidos e confirmar
        FollowNet_grid.Então deve ser exibido o alerta "Processo cadastrado com sucesso"
        FollowNet_grid.Quando pesquisar o registro na busca
        FollowNet_grid.Então deve ser exibido o registro correspondente
        Click Element                           xpath=//*[@id="grid${grid_di_id}_freeze_bodyDiv"]/table/tbody/tr/td[2]/div/div/a[5]        
        Sleep                                   5s
        Switch Window                           title:Desembaraço Importação - Manutenção de Contêineres dos Processos - Follow.Net                
        Click Element                           xpath=//*[@id="formPrincipal"]/div/p/a
        Wait Until Element Is Visible           xpath=//*[@id="formPrincipal"]/fieldset[1]
        Capture Page Screenshot

Dado que possua um container registrado para "${operacao}"
        Dado que esteja no cadastro de container
        Quando preencher os campos do container com dados validos e confirmar
        Entao deve ser exibida a mensagem "Container incluído com sucesso"

Quando preencher os campos do container com dados validos e confirmar        
        ${num_container} =  Generate Random String  8  [NUMBERS]       
        Input Text                      id:container_1                  ${num_container}
        Input Text                      id:obscarregamento_1                    Teste automatizado Robot
        Select From List By Index       id:tipo_container_1                     1
        Input Text                      id:tamanho_1                            9999
        Select From List By Index       id:modalidade_transporte_1              1
        Input Text                      id:armador_1                            Teste automatizado Robot
        Input Text                      id:tara_1                               9999
        Input Text                      id:lacre_cia_1                          9999
        Input Text                      id:lacre_tc_1                           9999
        Input Text                      id:peso_bruto_1                         9999
        Input Text                      id:volumes_1                            9999
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[12]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[13]/a[1]
        Input Text                      id:clocalentrega_1                      Teste automatizado Robot
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[15]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[16]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[17]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[18]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[19]/a[1]
        Input Text                      id:c_local_devolucao_vazio_1            Teste automatizado Robot
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[21]/a[1]
        Select Radio Button             CNECELAVCONTEINER_1                     1
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[23]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[24]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[25]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[26]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[27]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[28]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[29]/a[1]
        Select Radio Button             removecargacdtransp_1                   1
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[31]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[32]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[33]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[34]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[35]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[36]/a[1]
        Input Text                      id:dias_sobre_estadia_1                 9999
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[38]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[39]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[40]/a[1]
        Input Text                      id:free_time_demurrage_1                9999
        Select Radio Button             demurrage_paga_1                        1
        Select Radio Button             rastreado_1                             1
        Select From List By Index       id:motivo_demurrage_1                   1
        Input Text                      id:nota_deb_demurrage_1                 9999
        Input Text                      id:valor_demurrage_1                    9999
        Select From List By Index       id:transpredespacho_1                   1
        Select From List By Index       id:idtipocaminhao_1                     1
        Input Text                      id:nome_motorista_1                     Teste automatizado Robot
        Input Text                      id:placa_cavalo_1                       9999
        Input Text                      id:placa_carreta_1                      9999                
        Input Text                      id:nf_fiscal_1                          9999
        Input Text                      id:cfop_1                               9999
        Input Text                      id:numero_cte_1                         9999
        Input Text                      id:ctecomplementar_1                    9999
        Input Text                      id:c_numero_cte_remocao_1               9999
        Select Radio Button             revisaocte_1                            1
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[58]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[59]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[60]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[61]/a[1]        
        Select From List By Index       id:tipo_volume_container_1              1
        Select From List By Index       id:classificacaoatendimento_1           1
        Select Radio Button             procedeclassificacao_1                  1
        Input Text                      id:mercadoria_1                         Teste automatizado Robot
        Input Text                      id:invoice_1                            9999
        Input Text                      id:peso_liquido_1                       9999
        Input Text                      id:valor_armazenagem_desova_1           9999
        Input Text                      id:nvlrfretepeso_1                      9999
        Input Text                      id:nvlrescolta_1                        9999
        Input Text                      id:nvlrestacionamento_1                 9999
        Input Text                      id:nvlrajudante_1                       9999
        Input Text                      id:nvlradvalorem_1                      9999
        Input Text                      id:nvlrestadia_1                        9999
        Input Text                      id:nvlrdta_1                            9999
        Select Radio Button             cveiculodedicado_1                      1
        Input Text                      id:nvlremissaodraft_1                   9999
        Input Text                      id:nvlrpedagio_1                        9999
        Input Text                      id:nvlricms_1                           9999
        Input Text                      id:nvlrtotalnf_1                        9999
        Input Text                      id:vlriss_1                             9999
        Input Text                      id:vlrgris_1                            9999       
        Input Text                      id:obsfinanceira_1                      Teste automatizado Robot
        Capture Page Screenshot
        Click Element                   class:btSalvar

Quando alterar os campos do container com dados validos e confirmar
        Click Element                   xpath=//*[@id="formPrincipal"]/div/p/a[2]
        ${num_container} =  Generate Random String  8  [NUMBERS]       
        Input Text                      id:container_1                  ${num_container}
        Input Text                      id:obscarregamento_1                    Teste automatizado Robot edição
        Select From List By Index       id:tipo_container_1                     2
        Input Text                      id:tamanho_1                            5555
        Select From List By Index       id:modalidade_transporte_1              2
        Input Text                      id:armador_1                            Teste automatizado Robot edição
        Input Text                      id:tara_1                               5555
        Input Text                      id:lacre_cia_1                          5555
        Input Text                      id:lacre_tc_1                           5555
        Input Text                      id:peso_bruto_1                         5555
        Input Text                      id:volumes_1                            5555
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[12]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[13]/a[1]
        Input Text                      id:clocalentrega_1                      Teste automatizado Robot edição
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[15]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[16]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[17]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[18]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[19]/a[1]
        Input Text                      id:c_local_devolucao_vazio_1            Teste automatizado Robot edição
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[21]/a[1]
        Select Radio Button             CNECELAVCONTEINER_1                     0
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[23]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[24]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[25]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[26]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[27]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[28]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[29]/a[1]
        Select Radio Button             removecargacdtransp_1                   0
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[31]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[32]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[33]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[34]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[35]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[36]/a[1]
        Input Text                      id:dias_sobre_estadia_1                 5555
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[38]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[39]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[40]/a[1]
        Input Text                      id:free_time_demurrage_1                5555
        Select Radio Button             demurrage_paga_1                        0
        Select Radio Button             rastreado_1                             0
        Select From List By Index       id:motivo_demurrage_1                   2
        Input Text                      id:nota_deb_demurrage_1                 5555
        Input Text                      id:valor_demurrage_1                    5555
        Select From List By Index       id:transpredespacho_1                   2
        Select From List By Index       id:idtipocaminhao_1                     2
        Input Text                      id:nome_motorista_1                     Teste automatizado Robot edição
        Input Text                      id:placa_cavalo_1                       5555
        Input Text                      id:placa_carreta_1                      5555                
        Input Text                      id:nf_fiscal_1                          5555
        Input Text                      id:cfop_1                               5555
        Input Text                      id:numero_cte_1                         5555
        Input Text                      id:ctecomplementar_1                    5555
        Input Text                      id:c_numero_cte_remocao_1               5555
        Select Radio Button             revisaocte_1                            0
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[58]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[59]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[60]/a[1]
        Click Element                   xpath=//*[@id="formPrincipal"]/fieldset[1]/ul/li[61]/a[1]        
        Select From List By Index       id:tipo_volume_container_1              2
        Select From List By Index       id:classificacaoatendimento_1           2
        Select Radio Button             procedeclassificacao_1                  0
        Input Text                      id:mercadoria_1                         Teste automatizado Robot edição
        Input Text                      id:invoice_1                            5555
        Input Text                      id:peso_liquido_1                       5555
        Input Text                      id:valor_armazenagem_desova_1           5555
        Input Text                      id:nvlrfretepeso_1                      5555
        Input Text                      id:nvlrescolta_1                        5555
        Input Text                      id:nvlrestacionamento_1                 5555
        Input Text                      id:nvlrajudante_1                       5555
        Input Text                      id:nvlradvalorem_1                      5555
        Input Text                      id:nvlrestadia_1                        5555
        Input Text                      id:nvlrdta_1                            5555
        Select Radio Button             cveiculodedicado_1                      0
        Input Text                      id:nvlremissaodraft_1                   5555
        Input Text                      id:nvlrpedagio_1                        5555
        Input Text                      id:nvlricms_1                           5555
        Input Text                      id:nvlrtotalnf_1                        5555
        Input Text                      id:vlriss_1                             5555
        Input Text                      id:vlrgris_1                            5555       
        Input Text                      id:obsfinanceira_1                      Teste automatizado Robot edição
        Capture Page Screenshot
        Click Element                   class:btSalvar

Quando marcar o container para exclusao e confirmar
        Click Element                   xpath=//*[@id="formPrincipal"]/div/p/a[3]
        Click Element                   id:excluir_1
        Capture Page Screenshot
        Click Element                   class:btSalvar

Entao deve ser exibida a mensagem "${mensagem}"
        Page Should Contain             ${mensagem}
        Capture Page Screenshot
        Click Element                   xpath=/html/body/div/table/tbody/tr[4]/td/table/tbody/tr[5]/td/p/a/img
