*** Settings ***
Resource                ../resource.robot
Resource                ../pages/FollowNet_capa.robot
Resource                ../pages/FollowNet_grid.robot
Test Setup              Abrir navegador
#Test Teardown           Fechar navegador

*** Variables ***
## No Windows coloque barra dupla assim como mostra o exemplo abaixo!
#${FILE}         D:\\a\\1\\s\\RobotFramework\\Arquivos\\arquivo_upload.txt
${FILE}          C:\\Testes\\BDD_Follownet\\RobotFramework\\Arquivos\\arquivo_upload.txt


*** Test Case ***
Cenario: Download de arquivo
        Dado que tenha um processo de DI para "cadastrar" e feito upload do arquivo "${FILE}"
        Quando clicar no link de download do arquivo

