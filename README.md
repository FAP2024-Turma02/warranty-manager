# API Documentation - Warranty Management

## **1. Autenticação do Usuário**

### **Login**
- **Endpoint:** `POST /auth/sign_in`
- **Descrição:** Autentica o usuário com e-mail e senha, retornando tokens de autenticação para acesso aos recursos protegidos da API.
- **Headers:**
  - `Content-Type: application/json`
- **Parâmetros de Requisição:**
  - `email` (string) - Email do usuário (obrigatório).
  - `password` (string) - Senha do usuário (obrigatório).
- **Códigos de Status:**
  - `200 OK` - Login bem-sucedido.
  - `401 Unauthorized` - Credenciais inválidas.

**Exemplo de Requisição:**
```json
{
  "email": "igor@email.com",
  "password": "igorrocha"
}
```

**Exemplo de Resposta:**
```json
{
    "data": {
        "email": "igor@email.com",
        "provider": "email",
        "uid": "igor@email.com",
        "id": 2,
        "name": "Igor",
        "role": "admin",
        "admin": true,
        "allow_password_change": false
    }
}
```

### **Logout**
- **Endpoint:** `DELETE /auth/sign_out`
- **Descrição:** Encerra a sessão do usuário, invalidando o token de autenticação.
- **Headers:**
  - `Authorization: Bearer <token>`

---

## **2. Usuário (User)**

### **Criar Usuário**
- **Endpoint:** `POST /auth`
- **Descrição:** Cria um novo usuário na plataforma.
- **Parâmetros de Requisição:**
  - `name` (string) - Nome do usuário.
  - `email` (string) - E-mail do usuário.
  - `password` (string) - Senha.
  - `confirm_password` (string) - Confirmação da senha.
- **Códigos de Status:**
  - `201 Created` - Usuário criado com sucesso.
  - `422 Unprocessable Entity` - Erro de validação.

**Exemplo de Requisição:**
```json
{
  "name": "Felipe",
  "email": "felipe@email.com",
  "password": "feliperocha",
  "confirm_password": "feliperocha"
}
```

### **Atualizar Usuário**
- **Endpoint:** `PATCH /users/:id`
- **Descrição:** Atualiza informações de um usuário existente.
- **Parâmetros:**
  - `name`, `email`, `password` (opcionais)

**Exemplo de Requisição:**
```json
{
  "user": {
    "name": "Carol"
  }
}
```

### **Listar Usuários**
- **Endpoint:** `GET /users`
- **Descrição:** Retorna uma lista de todos os usuários cadastrados.
- **Filtros de Busca (Ransack):**
  - `q[name_cont]=João` - Filtra usuários com nome contendo "João".

---

## **3. Nota Fiscal (Invoice)**

### **Criar Nota Fiscal**
- **Endpoint:** `POST /invoices`
- **Descrição:** Registra uma nova nota fiscal vinculada ao usuário autenticado.
- **Parâmetros:**
  - `invoice_number` (string) - Número da nota.
  - `purchase_date` (date) - Data de compra.
  - `issue_date` (date) - Data de emissão.

**Exemplo de Requisição:**
```json
{
  "invoice_number": "INV202504022040",
  "purchase_date": "2025-02-04",
  "issue_date": "2025-02-04"
}
```

### **Atualizar Nota Fiscal**
- **Endpoint:** `PATCH /invoices/:id`
- **Descrição:** Atualiza dados de uma nota fiscal existente.
- **Códigos de Status:**
  - `200 OK` - Atualização bem-sucedida.
  - `404 Not Found` - Nota fiscal não encontrada.

### **Listar Notas Fiscais**
- **Endpoint:** `GET /invoices`
- **Filtros de Busca:**
  - `q[invoice_number_cont]=1234` - Busca por número parcial da nota.

---

## **4. Produto (Product)**

### **Criar Produto**
- **Endpoint:** `POST /products`
- **Descrição:** Adiciona um novo produto, associando-o a uma nota fiscal e uma loja.
- **Parâmetros:**
  - `name` (string) - Nome do produto.
  - `description` (string) - Descrição.
  - `price` (number) - Preço.
  - `serial_number` (string) - Número de série.
  - `warranty_expiry_date` (date) - Data de expiração da garantia.

### **Filtros de Busca:**
- `q[price_gt]=1000` - Filtra produtos com preço acima de 1000.
- `q[category_eq]=Eletrônicos` - Produtos da categoria "Eletrônicos".

---

## **5. Garantia (Warranty)**

### **Criar Garantia**
- **Endpoint:** `POST /warranties`
- **Parâmetros:**
  - `warranty_number` (string) - Número da garantia.
  - `issue_date` (date) - Data de emissão.
  - `expirity_date` (date) - Data de expiração.
  - `product_id` (integer) - ID do produto associado.
  - `validity_period` (integer) - Período de validade em meses.

**Exemplo de Requisição:**
```json
{
  "warranty": {
    "warranty_number": "WT20260204",
    "issue_date": "2025-02-04",
    "expirity_date": "2027-02-04",
    "product_id": 2,
    "validity_period": 12
  }
}
```

### **Códigos de Erro:**
- `404 Not Found` - Garantia não encontrada.
- `422 Unprocessable Entity` - Dados inválidos.

---

## **6. Loja (Store)**

### **Criar Loja**
- **Endpoint:** `POST /stores`
- **Parâmetros:**
  - `name` (string) - Nome da loja.
  - `contact` (string) - E-mail de contato.
  - `address` (string) - Endereço da loja.

### **Atualizar Loja**
- **Endpoint:** `PATCH /stores/:id`
- **Descrição:** Atualiza informações de uma loja existente.

### **Listar Lojas**
- **Endpoint:** `GET /stores`
- **Filtros de Busca:**
  - `q[name_cont]=Kabum` - Filtra lojas com nome "Kabum".

---

## Site da Documentação

https://documenter.getpostman.com/view/37524459/2sAYX6ngV8

