*** Settings ***
Resource                ../resource.robot
Resource                ../pages/FollowNet_capa.robot
Resource                ../pages/FollowNet_grid.robot
Test Setup              Abrir navegador
Test Teardown           Fechar navegador


*** Test Case ***
Cenario: Valores processo
      Dado que possua um processo de DI para "cadastrar"
      Quando clicar no link de valores processo, o mesmo será exibido

