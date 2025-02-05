# 📦 Warranty Management API

API para gerenciamento de usuários, notas fiscais, produtos, garantias e lojas. Suporta autenticação via token, operações CRUD e filtros avançados com Ransack.

## 🚀 **Base URL**
```
http://localhost:4000
```

## 🔐 **Autenticação**
A API utiliza autenticação via token (Bearer Token).

**Exemplo de Header:**
```
Authorization: Bearer <seu_token_aqui>
```

---

## 👤 **Usuário (User)**

- **Criar Usuário**  
  `POST /auth`  
  Criação de novo usuário.

- **Login**  
  `POST /auth/sign_in`  
  Retorna o token de autenticação.

- **Listar Usuários**  
  `GET /users`  
  Retorna todos os usuários (requer permissão).

- **Atualizar Usuário**  
  `PATCH /users/:id`  
  Atualiza informações de um usuário.

- **Excluir Usuário**  
  `DELETE /users/:id`  
  Remove um usuário do sistema.

---

## 🧾 **Nota Fiscal (Invoice)**

- **Criar Nota Fiscal**  
  `POST /invoices`

- **Listar Notas Fiscais**  
  `GET /invoices`

- **Atualizar Nota Fiscal**  
  `PATCH /invoices/:id`

- **Excluir Nota Fiscal**  
  `DELETE /invoices/:id`

---

## 📦 **Produto (Product)**

- **Criar Produto**  
  `POST /products`

- **Listar Produtos**  
  `GET /products`

- **Atualizar Produto**  
  `PATCH /products/:id`

- **Excluir Produto**  
  `DELETE /products/:id`

---

## 🛡️ **Garantia (Warranty)**

- **Criar Garantia**  
  `POST /warranties`

- **Listar Garantias**  
  `GET /warranties`

- **Atualizar Garantia**  
  `PATCH /warranties/:id`

- **Excluir Garantia**  
  `DELETE /warranties/:id`

---

## 🏬 **Loja (Store)**

- **Criar Loja**  
  `POST /stores`

- **Listar Lojas**  
  `GET /stores`

- **Atualizar Loja**  
  `PATCH /stores/:id`

- **Excluir Loja**  
  `DELETE /stores/:id`

---

## ⚠️ **Códigos de Status**
- `200 OK` - Requisição bem-sucedida
- `201 Created` - Recurso criado com sucesso
- `401 Unauthorized` - Falha na autenticação
- `403 Forbidden` - Acesso não autorizado
- `404 Not Found` - Recurso não encontrado
- `422 Unprocessable Entity` - Erro de validação

## 📌 **Filtros de Busca (Ransack)**
- `q[name_cont]=João` → Filtra usuários com "João" no nome
- `q[price_gt]=1000` → Produtos com preço maior que 1000

---

## 📫 **Contato**
Desenvolvido por Felipe Rocha, Danielle Fraga, Fabio Bezerra, Mathias Soares e Renan. Para dúvidas, envie um DM.



---

## Site da Documentação

https://documenter.getpostman.com/view/37524459/2sAYX6ngV8

