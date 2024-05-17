***Settings***
Resource    ../resources/cadastro_usuario.resource
Resource    ../resources/Atualizar_cadastro_produtos.resource

***Test Case***
Cenario Put: Atualizar cadastro de produto
  Logar usuários
  Verificar se usuario foi logado
  Cadastrar novo produto
  Verificar se o produto foi cadastrado com sucesso
  Atualizar cadastro de produto
  Verificar se o cadastro foi atualizado com sucesso 
  