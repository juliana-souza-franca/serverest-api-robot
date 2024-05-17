*** Settings ***
Resource       ../utils/settings.resource



*** Keywords ***

Dados dianmicos 
  ${palavra_randomica_Nome}    Generate Random String     length=14      chars=[LETTERS]
  ${palavra_randomica_Nome}    Convert To Lower Case       ${palavra_randomica_Nome}

  ${palavra_randomica_Email}    Generate Random String     length=14    chars=\[LETTERS\]\[NUMBERS\]
  ${palavra_randomica_Email}    Convert To Lower Case        ${palavra_randomica_Email}

  ${palavra_randomica_Produtos}    Generate Random String     length=10      chars=[LETTERS]
  ${palavra_randomica_Produtos}    Convert To Lower Case       ${palavra_randomica_Produtos}

  ${palavra_randomica_Quantidade_preco}    Generate Random String     length=8    chars=[NUMBERS]
  ${palavra_randomica_Quantidade_preco}    Convert To Lower Case        ${palavra_randomica_Quantidade_preco}


   Set Test Variable       ${NOME_COMPLETO}       ${palavra_randomica_Nome}
   Log                     ${NOME_COMPLETO} 
 
   Set Test Variable       ${EMAIL}                ${palavra_randomica_Email}@gmail.com
   Log                     ${EMAIL} 

   Set Test Variable      ${NOME_PRODUTO}          ${palavra_randomica_Produtos} 
   Log                    ${NOME_PRODUTO} 

   Set Test Variable      ${PRECO}                 ${palavra_randomica_Quantidade_preco} 
   Log                    ${PRECO}     

   Set Test Variable      ${QUANTIDADE}            ${palavra_randomica_Quantidade_preco} 
   Log                    ${QUANTIDADE} 

   Set Test Variable      ${DESCRICAO}             ${palavra_randomica_Nome}
   Log                    ${DESCRICAO}   