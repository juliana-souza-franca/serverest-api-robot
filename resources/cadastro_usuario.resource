*** Settings ***
Resource    ../utils/settings.resource
Resource    ../headers/headers.resource
Resource    ../dinamic_variables/dados_dinamicos.resource
Resource    ../dinamic_variables/variaveis.resource

*** Keywords ***

cadastro de usuario
  Criar sessão
   
   Dados dianmicos
   ${body}   Create Dictionary     nome=${NOME_COMPLETO}     email=${EMAIL}    password=${SENHA_USUARIO}     administrador=true
   Log    ${body}
   
   Criar sessão
   
   ${response}   POST On Session    alias=SERVEREST     url=${ENDPOINT_USUARIOS}     json=${body}
   Log    ${response.json()}
   Set Test Variable    ${ID_USUARIO}    ${response.json()["_id"]}
   Set Test Variable    ${RESPOSTA}      ${response.json()}     
Verificar se usuario foi cadastrado 
  Log    ${RESPOSTA} 
  Dictionary Should Contain Item   ${RESPOSTA}    message   ${MENSAGEM_CADASTRO_SUCESSO}
  Dictionary Should Contain Key    ${RESPOSTA}    _id