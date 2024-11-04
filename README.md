# Padrões utilizados

Os arquivos foram segregados nos seguintes diretorios.

1. Pages

Keywords, variaveis e Locator separados por arquivos dentro do diretorio conforme pagina HTML que esta faz parte.

Variaveis seguem o padrão de nomeclatura ${Nome da page_Tipo de objeto}, em maiusculo se for uma variavel global.

Locator devem estar dentro de variaveis.

Variaveis e Keywords gerais que são utilizados em mais de uma page devem ficar no arquivo Resource.robot.

Keywords que fazem parte de outra pages porem são chamadas por outra keyword devem conter antes de sua definição o nome da page que faz parte inicialmente seguida de ponto. 
Exemplo: Home.Aqui vai o nome da Keyword

2. Tests

Cenarios de testes escritos seguindo BDD.

Comentarios referindo historia correspondente ao cenario, caso exista uma.

Arquivo Test-case por funcionalidade.

# Dependências

1.	Robot Framework
2.	Library SeleniumLibrary