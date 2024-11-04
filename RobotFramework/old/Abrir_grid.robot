*** Settings ***
Resource                ../resource.robot
Resource                ../pages/FollowNet_capa.robot
Resource                ../pages/FollowNet_grid.robot
Test Setup              Abrir navegador
Test Teardown           Fechar navegador 

*** Test Case ***
Cenario: Abertura do grid de DI
        Dado que esteja no FollowNet Grid        
        Quando clicar no Grid "166301"
        Então deve ser exibido o Grid "166301"