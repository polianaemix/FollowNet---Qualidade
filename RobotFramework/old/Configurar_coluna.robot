*** Settings ***
Resource                ../resource.robot
Resource                ../pages/FollowNet_capa.robot
Resource                ../pages/FollowNet_grid.robot
Test Setup              Abrir navegador
#Test Teardown           Fechar navegador

*** Test Case ***
Cenario: Adicao de coluna no grid de DI
        Dado que esteja na configuração de colunas de DI
        Quando marcar uma coluna para exibir e confirmar a alteração
        Então a coluna deve ser exibida no grid de DI

Cenario: Exclusao de coluna no grid de DI
        Dado que esteja na configuração de colunas de DI
        Quando ocultar uma coluna e confirmar a alteração
        Então a coluna deve ser ocultada no grid de DI