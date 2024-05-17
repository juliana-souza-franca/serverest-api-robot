*** Settings ***
Resource    ../utils/settings.resource

*** Keywords ***
Criar sessão authorization
   [Arguments]        ${LOGIN_USUÁRIO} 
   
   ${headers}    Create Dictionary       accept=application/json     Content-Type=application/json     Authorization=${LOGIN_USUÁRIO} 
   Create Session    alias=SERVEREST     url=https://serverest.dev       headers=${headers}   