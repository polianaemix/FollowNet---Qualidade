*** Settings ***
Resource                ../resource.robot
Resource                ../pages/FollowNet_capa.robot
Resource                ../pages/FollowNet_grid.robot
Test Setup              Abrir navegador
Test Teardown           Fechar navegador 

*** Test Case ***
Cenario: Inclusao de processo de DI
        Dado que esteja na inclusão de processo no grid de DI
        Quando buscar por um processo e adicioná-lo ao grid
        Então deve ser exibido o processo correspondente no grid
