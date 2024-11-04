*** Settings ***
Resource                ../resource.robot
Resource                ../pages/FollowNet_capa.robot
Resource                ../pages/FollowNet_grid.robot

Test Setup              Abrir navegador
Test Teardown           Fechar navegador

*** Test Case ***
Cenario: Gerar relatorio de DI
        Dado que esteja no modulo de DI
        Quando clicar no menu relatorios
        Entao deve ser preenchido as informacoes e gerado o relatorio de DI
