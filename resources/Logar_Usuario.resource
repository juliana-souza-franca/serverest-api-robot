*** Settings ***
Resource       ../utils/settings.resource
Resource       ../headers/headers.resource
Resource       ../dinamic_variables/variaveis.resource
Resource       ./cadastro_usuario.resource

*** Keywords ***

 Logar usuários
   cadastro de usuario

  ${body}   Create Dictionary       email=${EMAIL}     password=${SENHA_USUARIO}
  Log     ${body} 
  Criar sessão

  ${response}=    POST On Session    alias=SERVEREST      url=${ENDPOINT_LOGIN}    json=${body}
  Log    ${response.status_code}
  Log    ${response.content}
  ${response.json()}     Evaluate    json.loads($response.content)    json
  Log   ${response.json()}
  Should Be Equal As Strings    ${response.status_code}    200  
    Set Test Variable    ${LOGIN_USUÁRIO}       ${response.json()["authorization"]} 
    Set Test Variable    ${RESPOSTA}           ${response.json()} 
    
    
     
Verificar se usuario foi logado
  Log     ${RESPOSTA}
  Dictionary Should Contain Item   ${RESPOSTA}    message   ${MENSAGEM_LOGIN_SUCESSO}
  Dictionary Should Contain Key    ${RESPOSTA}    authorization


   
