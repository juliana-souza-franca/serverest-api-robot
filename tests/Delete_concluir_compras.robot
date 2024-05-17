***Settings***
Resource    ../resources/cadastro_usuario.resource
Resource    ../resources/Concluir_compras.resource

***Test Case***
Cenario Delete: Concluir compras do carrinho
  Logar usuários
  Verificar se usuario foi logado
  Cadastrar novo produto
  Verificar se o produto esta cadastrado com sucesso
  Cadastro do carrinho
  Verificar se o carrinho foi cadastrado com sucesso
  Concluir compras
  Verificar se a compra foi concluida com sucesso 
  

  