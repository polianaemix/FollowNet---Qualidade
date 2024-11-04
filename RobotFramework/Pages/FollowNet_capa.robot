*** Settings ***
Resource     Login.robot

*** Keywords ***
#PRE-CONDICOES
Dado que esteja na capa do FollowNet
        Login.Dado que esteja na pagina de Login
        Login.Quando preencher os campos email "sanmara.alves@emix.com.br" e senha "Emix@182930"
       ## Login.Quando preencher os campos email "test.robot.fn@emix.com.br" e senha "eMix@SA#2021"
        Login.Então deve ser exibido o nome do usuário no cabeçalho "sanmara.alves@emix.com.br"
        Capture Page Screenshot

#AÇÕES


Quando clicar no FollowNet Mais Opções
        Title Should Be                                 Novo Grid
        Click Element                                  xpath=/html/body/div/table/tbody/tr[5]/td/table[1]/tbody/tr/td[2]/a
      #  Switch Window                                   title:e.Mix FollowNet
        Set Window Size                                 1920    1080
        Capture Page Screenshot

Quando clicar no FollowNet Grid
        Click Element                                   class:btn-grid2
        Switch Window                                   title:e.Mix Follow.Net: Grid
        Set Window Size                                 1920    1080        
        Capture Page Screenshot

Quando clicar no FollowNet Manager
        Click Element                                   class:btn-manager
        Switch Window                                   title:e.Mix Follow.Net: Manager
        Set Window Size                                 1920    1080
        Capture Page Screenshot

Quando clicar no FollowNet Carga de dados
        Click Element                                   class:btn-dropdown
        Click Element                                   xpath=/html/body/div/table/tbody/tr[5]/td/table[1]/tbody/tr/td[2]/div/a[8]
       # Switch Window                                   title:e.Mix Follow.Net: Grid
        Set Window Size                                 1920    1080
        Capture Page Screenshot