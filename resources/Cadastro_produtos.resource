*** Settings ***
Resource       ../utils/settings.resource
Resource       ../headers/headers_Authorization.resource
Resource       ../headers/headers.resource
Resource       ../dinamic_variables/dados_dinamicos.resource
Resource       ../dinamic_variables/variaveis.resource
Resource       ./cadastro_usuario.resource

*** Keywords ***
 Logar usuários
   cadastro de usuario

  ${body}   Create Dictionary       email=${EMAIL}    password=${SENHA_USUARIO}
  Log     ${body} 
  Criar sessão

  ${response}=    POST On Session    alias=SERVEREST      url=/login      json=${body}      
  Log    ${response.status_code}
  Log    ${response.content}
  ${response.json()}     Evaluate    json.loads($response.content)    json
  Log   ${response.json()}
  Should Be Equal As Strings    ${response.status_code}    200  
    Set Test Variable    ${LOGIN_USUÁRIO}       ${response.json()["authorization"]} 
    Set Test Variable    ${RESPOSTA}           ${response.json()} 
    
     
Verificar se usuario foi logado
  Log     ${RESPOSTA}
  Dictionary Should Contain Item   ${RESPOSTA}    message     ${MENSAGEM_LOGIN_SUCESSO} 
  Dictionary Should Contain Key    ${RESPOSTA}    authorization


 Cadastrar novo produto
   Dados dianmicos
  ${body}    Create Dictionary    nome=${NOME_PRODUTO}       preco=${PRECO}    descricao=${DESCRICAO}      quantidade=${QUANTIDADE} 
  Log     ${body} 
  Criar sessão authorization    ${LOGIN_USUÁRIO}

  ${response}   POST On Session    alias=SERVEREST     url=/produtos    json=${body}
   Log    ${response.json()}
   Set Test Variable    ${ID_PRODUTO}    ${response.json()["_id"]}
   Set Test Variable    ${RESPOSTA}      ${response.json()}    

 Verificar se o produto foi cadastrado com sucesso
  Log     ${RESPOSTA}  
   Dictionary Should Contain Item   ${RESPOSTA}      message   ${MENSAGEM_CADASTRO_SUCESSO}
   Dictionary Should Contain Key   ${RESPOSTA}      _id