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