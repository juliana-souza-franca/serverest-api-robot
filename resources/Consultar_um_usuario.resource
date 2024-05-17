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

Consultar um usuario
  ${Consulta_id_usuario}   GET On Session   alias=SERVEREST     url=${ENDPOINT_USUARIOS}/${ID_USUARIO}   expected_status=200
  Set Test Variable     ${CONSULTARIDUSUARIO}    ${Consulta_id_usuario.json()} 

 Verificar se um usuário foi consultado 
  Log     ${CONSULTARIDUSUARIO}
  Dictionary Should Contain Item     ${CONSULTARIDUSUARIO}   nome    ${NOME_COMPLETO}
  Dictionary Should Contain Item     ${CONSULTARIDUSUARIO}   email    ${EMAIL} 
  Dictionary Should Contain Item     ${CONSULTARIDUSUARIO}   password    ${SENHA_USUARIO} 
  Dictionary Should Contain Item     ${CONSULTARIDUSUARIO}   administrador    true
  Dictionary Should Contain Key     ${CONSULTARIDUSUARIO}    _id  




 
