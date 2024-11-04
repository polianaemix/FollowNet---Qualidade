*** Settings ***
Resource                ../resource.robot
Resource                ../pages/FollowNet_capa.robot
Resource                ../pages/FollowNet_grid.robot
Test Setup              Abrir navegador
Test Teardown           Fechar navegador 

*** Test Case ***
Cenario: Filtro de processo de DI
        Dado que possua um processo de DI para "filtrar"
        Quando pesquisar o registro na busca
        Então deve ser exibido o registro correspondente