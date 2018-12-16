# Formas Normais
*Retirado do roteiro de aula do Prof. João Marcelo Borovina Josko, CMCC/UFABC.*

1. Nessa questão você vai "sujar" os dados ao tentar
   manipular dados representados em uma relação com
   baixo nível de qualidade, conforme observado na
   tabela abaixo.

   | EmpNro | EmpNome  | DepteNome | DeptoNro | DeptoNome  | DeptoGerente |
   | ------ | -------- | --------- | -------- | ---------- | ------------ |
   | 21     | João     | NULL      | 5        | Financeiro | 91           |
   | 22     | Maria    | André     | 5        | Financeiro | 91           |
   | 22     | Maria's  | Rosana    | 5        | Financeiro | 91           |
   | 23     | Ana      | Carlos    | 6        | Tesouraria | 91           |
   | 23     | Ana      | Ricardo   | 6        | Tesouraria | 93           |
   | 24     | Carlos   | NULL      | 5        | Financeiro | 91           |
   | 25     | Teobaldo | NULL      | 7        | Operações  | 94           |

   Baseado nessa relação, pede-se:

   1. Escreva uma sequencia de instruções SQL com
      elementos de linguagem procedural (`if`, `while`
      etc.) que permitam acrescentar um dependente.
      Assuma que você receberá o número do empregado
      e o nome do dependente. Assuma que você irá
      acrescentar um dependente para os empregados
      22 e 24.

   2. Aplique o processo de normalização na relação
      `EmpMess` e, então, apresente o SQL-DDL do
      resultado da normalização (as relações, 
      atributos, chaves primárias e estrangeiras).

2. Para responder as perguntas abaixo observe as respostas
   das instruções SQL, o conteúdo das relaçõs, bem como
   os elementos semânticos (*user functions*, 
   *constraints*, *triggers* etc.) atribuídos as relações
   que compõem o referido modelo.

   1. Execute a seguinte operação

      ```sql
      insert into medico values (1, 'CarlosAlberto', 'P');
      ```

      Veja o resultado dessa operação. Por que foi
      possível acrescentar o mesmo médico? O que você
      deveria fazer para impedir casos semelhantes?
  
   2. Execute a seguinte operação

      ```sql
      insert into medico values (2, 'AnaClara', 'X');
      ```

      Veja o resultado dessa operação. Por que não
      foi possível acrescentar o médico? Qual foi o
      recurso e o respectivo nome no modelo em questão
      que impediu tal operação?

   3. Execute a seguinte operação

      ```sql
      insert into paciente values (13, 'RivaldoRiver', 250);
      ```

      Veja o resultado dessa operação. Por que foi
      possível acrescentar um paciente com essa idade?
      O que você deveria fazer para impedir casos
      semelhantes?

   4. Execute a seguinte operação

      ```sql
      insert into consulta values (12, 21, '10/10/2018');
      ```

      Veja o resultado dessa operação. Por que não
      foi possível acrescentar mais uma consulta no
      mesmo dia para médicos e pacientes distintos?
      O que você deveria fazer para impedir casos
      semelhantes e permitir múltiplas consultas
      no mesmo dia?

   5. Execute a seguinte operação

      ```sql
      insert into consulta values (99, 99, '11/11/2018');
      ```

      Veja o resultado dessa operação. Por que foi
      possível acrescentar uma consulta a médicos ou
      pacientes inexistentes? O que você deveria
      fazer para impedir casos semelhantes?
