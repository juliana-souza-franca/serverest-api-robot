***Settings***
Resource    ../resources/cadastro_usuario.resource
Resource    ../resources/Cadastro_produtos.resource

***Test Case***
Cenario Post: Cadastrar Produtos
  Logar usuários
  Verificar se usuario foi logado
  Cadastrar novo produto
  Verificar se o produto foi cadastrado com sucesso
  