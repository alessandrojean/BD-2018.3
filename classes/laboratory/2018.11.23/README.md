# Modelagem Conceitual
*Retirado do roteiro de aula do Prof. João Marcelo Borovina Josko, CMCC/UFABC.*

1. Elaborar um modelo EER que represente a realidade
   de uma empresa que trabalha orientada a projetos.
   Todos os colaboradores dessa empresa podem estar
   associados em um ou mais projetos, mas estão
   administrativamente lotados a um único departamento.
   Sabe-se que um dos colaboradores associados a
   cada projeto possui o papel de gestor, mas nem
   todo projeto possui um gestor. Tanto projetos
   quanto departamentos podem apresentar vários
   colaboradores.

   Para cada colaborador operário atuando em cada
   projeto é contabilizado o tempo de utilização
   das máquinas industriais. Certos colaboradores
   são vendedores que utilizam os carros da empresa
   para visitar clientes em certa data. Outros
   colaboradores são motoristas que usam caminhões
   da empresa para realizar as entregas dos
   produtos aos clientes.

   Cada projeto consome um conjunto de peças, sendo
   que essas podem ser formadas por outras peças.
   Sabe-se que diferentes fornecedores podem ser
   potenciais provedores de várias peças. Contudo,
   a empresa costuma adquirir peças de diferentes
   fornecedores de modo a não concentrar suas
   necessidades em um único fornecedor.

   Verifique se o seu modelo é capaz de responder
   as questões a seguir. Caso não, refine-o.

   - Quais são os potenciais fornecedores da peça
     `X`? Dentre esses, quais fornecedores
     **efetivamente** fornecem a peça `X` a
     algum dos projetos da empresa?
   - O colaborador `C` atua em quais projetos?
     Em algum deles o colaborador `C` é gestor?

2. Elaborar um modelo EER para uma grande empresa
   de lotação de veículos que possui dois tipos
   de clientes: pessoas físicas (PF) e pessoas
   jurídicas (PJ). Das PFs a empresa precisa
   saber o nome e CPF, enquanto o CNPJ e razão
   social são requeridos para as PJs.

   Tal empresa possui várias filiais nas principais
   capitais brasileiras, cada qual com um conjunto
   próprio de veículos disponíveis para locação.
   Sabe-se que esses veículos podem ser automóveis,
   caminhões de carga e camionetas de passageiros
   identificados pela correspondente placa. Cada
   veículo apresenta uma agenda de revisões 
   determinada pela sua quilometragem. Durante o
   período de revisão o veículo fica indisponível
   para locação.

   Para qualquer locação são registrados a data
   de retirada e a data de entrega prevista.
   Sabe-se ainda que em muitas das locações a filial
   de retirada e de devolução do veículo são
   distintas. No término da locação, a empresa
   provê a Nota Fiscal de Serviço correspondente
   onde consta o valor da locação, os impostos e
   valores adicionais.

   Verifique se seu modelo é capaz de responder
   as questões a seguir. Caso não, refine-o.

   - Qual é a capacidade de carga dos caminhões
     e das camionetas? Qual é a capacidade de
     passageiros dos automóveis e das camionetas?
   - Quais veículos possuem ar-condicionado e
     câmbio automático?
   - Quais veículos estão disponíveis para locação
     neste exato momento?
   - Quais locações possuem a filial de retirada
     e devolução iguais? E quais são as diferentes?
