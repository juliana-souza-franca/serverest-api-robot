***Settings***
Resource    ../resources/cadastro_usuario.resource
Resource    ../resources/Cadastro_carrinho.resource

***Test Case***
Cenario Post: Cadastrar Carrinhos
  Logar usuários
  Verificar se usuario foi logado
  Cadastrar novo produto
  Verificar se o produto esta cadastrado com sucesso
  Cadastro do carrinho
  Verificar se o carrinho foi cadastrado com sucesso

  