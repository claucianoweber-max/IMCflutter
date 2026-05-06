# IMCflutter
Calculo de massa corporal (imc) em flutter
Calculadora de Índice de Massa Corporal (IMC) em Flutter

# Introdução
O presente projeto consiste no desenvolvimento de uma aplicação mobile utilizando o framework Flutter, com o objetivo de calcular o Índice de Massa Corporal (IMC) de um usuário a partir de dados fornecidos (peso e altura).
O IMC é amplamente utilizado na área da saúde como um indicador simples para classificação do estado nutricional de indivíduos.

# Objetivos
Objetivo Geral
Desenvolver uma aplicação funcional em Flutter para cálculo do IMC, aplicando conceitos fundamentais de desenvolvimento mobile.
Objetivos Específicos
Implementar interface gráfica utilizando Material Design
Validar entradas do usuário com formulários
Aplicar lógica matemática para cálculo do IMC
Utilizar gerenciamento de estado com setState
Exibir resultados com feedback visual (cores e classificação)

# Fundamentação Teórica
O Índice de Massa Corporal (IMC) é calculado por meio da seguinte fórmula:
IMC = peso / altura²
Onde:
Peso é dado em quilogramas (kg)
Altura é dada em metros (m)
Classificação segundo padrões internacionais:
IMC	Classificação
< 18.5	Abaixo do peso
18.5 – 24.9	Peso normal
25 – 29.9	Sobrepeso
≥ 30	Obesidade

# Tecnologias Utilizadas
Flutter — Framework para desenvolvimento multiplataforma
Dart — Linguagem de programação
Material Design — Padrão visual da aplicação
Arquitetura e Estrutura
O projeto segue uma estrutura simplificada, adequada para aplicações de pequeno porte:
lib/
 └── main.dart
Componentes principais:
•	CalculadoraIMCApp → Configuração geral do app
•	ImcPage → Tela principal (StatefulWidget)
•	_ImcPageState → Controle de estado e lógica

# Funcionamento da Aplicação
A aplicação realiza as seguintes etapas:
Coleta de dados do usuário (peso e altura)
Validação dos dados inseridos
Conversão de unidades (cm → m, se necessário)
Cálculo do IMC
Classificação automática
Exibição do resultado com feedback visual
Validações Implementadas
Para garantir a integridade dos dados, foram implementadas validações:
Campos obrigatórios
Conversão segura de valores numéricos
Valores maiores que zero
Interface e Experiência do Usuário
A interface foi projetada com foco em usabilidade:
Layout responsivo
Seleção de gênero com feedback visual
Campos centralizados para melhor leitura
Uso de cores para interpretação do resultado:
Verde - Peso normal
Laranja - Atenção
Vermelho - Obesidade

# Gerenciamento de Estado
O gerenciamento de estado é realizado utilizando o método setState, permitindo atualização dinâmica da interface conforme interação do usuário.
Execução do Projeto
Pré-requisitos:
Flutter instalado
Emulador ou dispositivo físico
Passos:
https://github.com/claucianoweber-max/IMCflutter.git
Resultados Obtidos
O sistema apresenta:
Cálculo correto do IMC com duas casas decimais
Classificação imediata
Interface intuitiva e funcional
Resposta em tempo real às alterações do usuário
Limitações do Projeto
Não armazena histórico de dados
Não possui integração com banco de dados
Classificação não diferencia por gênero ou idade
Não possui testes automatizados

Trabalho Futuro para sua...
Implementação de banco de dados local (SQLite)
Histórico de medições
Gráficos de evolução
Autor
Projeto desenvolvido por Clauciano Dias dos Santos weber como parte de atividades acadêmicas voltadas ao aprendizado de desenvolvimento mobile com Flutter.
Licença
Livre
Destinado exclusivamente para fins educacionais.

