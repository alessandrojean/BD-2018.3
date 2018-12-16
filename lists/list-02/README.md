# Lista de Exercícios Adicionais 2 - Modelagem
*Lista de exercícios do Prof. João Marcelo Borovina Josko, CMCC/UFABC*.

## Parte 1 - Modelagem Conceitual

Construa o Modelo Conceitual completo baseado na
necessidade abaixo.

Em uma Holding de Hospitais, cada unidade hospitalar é dividida em várias
alas onde pacientes podem ser internados, operados ou atendidos (consulta). 
Cada ala de internação possui uma quantidade de leitos e os andares que a
compõe, sendo identificada por um nome (por exemplo, ala de UTI nível 1). 
Por outro lado, cada ala de cirurgia possui a indicação dos andares que a 
compõe, as salas de operações e as especialidades de cada sala, isto é, 
para quais tipos de cirurgia cada sala está preparada (por exemplo, 
cardíaca, ortopedia etc.). Sabe-se que cada unidade hospitalar possui
nome e localização únicas, bem com vários números de telefone.

Cada Hospital precisa manter controle sobre todos os funcionários 
(enfermeiros, pessoal da manutenção, técnicos em radiografia etc.) que 
trabalham em cada uma de suas alas. De cada funcionário sabe-se o nome, 
o endereço, os telefones de contato e data de contratação. Uma prática
comum nas várias unidades hospitalares é que um funcionário `A` pode 
cobrir (ser substituído) um certo horário de trabalho de outro funcionário
`B`, mesmo que esses pertençam a unidades hospitalares diferentes. 
Nesses casos, a remuneração do funcionário `A` será por hora. 
Sabe-se que cada unidade hospitalar mantém um cadastro dos respectivos 
médicos com as dados de especialidades e número do CRM.

A cada paciente é associado um número de registro no hospital e sua ficha de 
inscrição deve ser preenchida com seu nome, endereço, data de nascimento, 
gênero, número de inscrição no SUS e tipo de convênio. Cada paciente pode 
ser atendido (atendimento normal ou retorno) por um ou mais médicos que, 
ao final do atendimento, emitem um diagnóstico. Cada diagnostico contém 
dados relativos ao tipo de diagnóstico, possíveis complicações e precauções, 
além da data e da hora do mesmo.

Caso julgem necessario, os médicos aindam podem requer uma lista de exames. 
Sabe-se que os exames solicitados pelos médicos devem ser realizados em um 
dos laboratórios que possuem convênio com uma das unidades hospitalares
da holding. Para cada laboratório são mantidas informações de nome, 
endereço, telefone, tipo de convênio, data de contrato, os tipos de 
exames cobertos e valor cobrado para cada tipo de exame.

Para cada exame agendado deve ser registrado a data e a hora do agendamento, 
bem como o tipo do exame. Sabe-se que cada exame efetuado deve apresentar um 
único resultado contendo um resumo, o tipo de resultado e um descritivo
detalhado do resultado. Baseado nesses exames, um médico em um atendimento 
de retorno pode determinar a internação de um paciente por meio da solicitação
de internação. A internação de um paciente é marcada pelo registro da data
e hora de internação, bem como a indicação de qual leito será utilizado. 
Por ocasião da alta, é necessário também conhecer a data e a hora da
saída do paciente.

Seu modelo é capaz de responder as questões abaixo? Caso negativo, 
enriqueça-o de modo a atender plenamente a necessidade do usuario.

- Quais sao os exames cobertos pelo laboratório `L`? 
  Dentre esses exames, quais deles sao cobertos pelo tipo de convênio `T`?
- Quais sao as consultas normais e as consultas de retorno 
  de certo paciente `X`?
- Qual foi a solicitação de internação utilizada para internar
  o paciente `P`?
- Quais foram os dias e períodos de trabalho do funcionario `A` na ala `Z`?
  Em algum desses dias e períodos o funcionario `A` foi substituído por 
  outro funcionário? Quem foi? 

## Parte 2 - Regras Semânticas Complexas

Apesar de apresentar um pequeno trecho do domínio de uma Rede Hospitar, 
o modelo gerado pode não ser capaz de representar visualmente certas 
regras mais complexas. Utilizando inferência, apresente duas regras 
complexas relevantes ao domínio que seu modelo não consegue explicitar. 
Deixo como exemplo a seguinte regra: "O atendimento de retorno de cada 
paciente deve ocorrer com o mesmo médico do atendimento normal".
