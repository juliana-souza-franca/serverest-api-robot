*** Settings ***
Resource    ../utils/settings.resource

*** Keywords ***
Criar sessão 
   ${headers}    Create Dictionary       accept=application/json     Content-Type=application/json
   Create Session    alias=SERVEREST     url=https://serverest.dev       headers=${headers}   