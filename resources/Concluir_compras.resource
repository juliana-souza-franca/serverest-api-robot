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
  ${body}   Create Dictionary       email=${EMAIL}  password=${SENHA_USUARIO}
  Log     ${body} 
  Criar sessão
   
  ${response}=    POST On Session    alias=SERVEREST      url=${ENDPOINT_LOGIN}       json=${body}      
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
  ${body}    Create Dictionary    nome=${NOME_PRODUTO}       preco=${PRECO}    descricao=${DESCRICAO}      quantidade=2
  Log     ${body} 
  Criar sessão authorization    ${LOGIN_USUÁRIO}

  ${response}   POST On Session    alias=SERVEREST     url=/produtos    json=${body}
   Log    ${response.json()}   
   Set Test Variable    ${ID_PRODUTO}    ${response.json()["_id"]}
   Set Test Variable    ${RESPOSTA}      ${response.json()}    
   Set Test Variable    &{PRODUTOS}   idProduto=${ID_PRODUTO}  quantidade=1 
   Set Test Variable    @{PRODUTOS}   ${PRODUTOS}  
Verificar se o produto esta cadastrado com sucesso
  Log     ${RESPOSTA}  
   Dictionary Should Contain Item   ${RESPOSTA}      message    ${MENSAGEM_CADASTRO_SUCESSO}
   Dictionary Should Contain Key   ${RESPOSTA}      _id


Cadastro do carrinho
  Criar sessão authorization    ${LOGIN_USUÁRIO}
    ${body}=    Create Dictionary    produtos=${PRODUTOS}  

    ${response}=    POST On Session    alias=SERVEREST    url=${ENDPOINT_CARRINHOS}    json=${body}     expected_status=201
    Log To Console    ${response.json()}
    Log    ${response.status_code}
    Log    ${response.json()}
    Set Test Variable    ${ID_CARRINHO}    ${response.json()["_id"]}
    Set Test Variable    ${RESPOSTA}    ${response.json()}
 Verificar se o carrinho foi cadastrado com sucesso
  Log     ${RESPOSTA}  
   Dictionary Should Contain Item   ${RESPOSTA}      message   ${MENSAGEM_CADASTRO_SUCESSO}
   Dictionary Should Contain Key   ${RESPOSTA}      _id

Concluir compras

    Criar sessão authorization    ${LOGIN_USUÁRIO}
      ${concluir}   DELETE On Session      alias=SERVEREST       url=${ENDPOINT_CONCLUIR_COMPRAS}       expected_status=200

    Set Test Variable    ${CARRINHO_CONCLUIDO}    ${concluir.json()}

Verificar se a compra foi concluida com sucesso 
  Log     ${CARRINHO_CONCLUIDO}
  Dictionary Should Contain Item   ${CARRINHO_CONCLUIDO}      message     ${MENSAGEM_EXCLUSAO} 