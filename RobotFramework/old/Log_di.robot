*** Settings ***
Resource                ../resource.robot
Resource                ../pages/FollowNet_capa.robot
Resource                ../pages/FollowNet_grid.robot
Test Setup              Abrir navegador
#Test Teardown           Fechar navegador


*** Test Case ***
Cenario: Log de processos
      Dado que possua um processo de DI para "cadastrar"
      Quando clicar no link de log do processo, o mesmo será exibido

