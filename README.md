# API Documentation: Warranty-Managment

## Overview
Esta documentação descreve os endpoints da API para o sistema.

---

## Endpoints

### Autenticação do Usuário

**Descrição:** Descrição da Requisição

Esta requisição é responsável por solicitar um token de autenticação para um usuário. O usuário pode ser um usuário comum ou um administrador, dependendo de suas permissões.

- **Usuário comum**: Possui acesso limitado e pode visualizar apenas as invoices que ele próprio adicionou.
    
- **Administrador**: Possui permissões ampliadas, permitindo acesso a funcionalidades administrativas.
    

O token retornado será utilizado para autenticar e autorizar as ações realizadas pelo usuário no sistema.

#### Auth Usuário

**Descrição:** Esta requisição autentica o usuário, verificando se ele é um usuário comum ou um administrador.

**URL:** `http://localhost:3000/auth/sign_in`

**Method:** `POST`

**Exemplo de Resposta (Auth Usuário Comum):**

- **Status:** 200 OK

```json
{
    "data": {
        "email": "jarimateia@example.com",
        "provider": "email",
        "uid": "jarimateia@example.com",
        "id": 2,
        "name": "Jose de Arimateia",
        "role": "user",
        "admin": false,
        "allow_password_change": false
    }
}
```

**Exemplo de Resposta (Auth Usuário Administrador):**

- **Status:** 200 OK

```json
{
    "data": {
        "email": "ecosta@example.com",
        "provider": "email",
        "uid": "ecosta@example.com",
        "id": 10,
        "name": "Eduardo Costa",
        "role": "admin",
        "admin": true,
        "allow_password_change": false
    }
}
```

---

### User

**Descrição:** Esta requisição permite a criação, autenticação, atualização ou remoção de usuários no sistema. O usuário pode ser comum ou administrador, com permissões específicas baseadas no seu tipo. A autenticação envolve a verificação das credenciais (login e senha), enquanto a criação e atualização permitem o gerenciamento de informações de usuário, como nome, e-mail e nível de permissão.

#### Criar User

**Descrição:** Essa requisição cria o usuário com os atributos necessário.

**URL:** `http://localhost:3000/auth`

**Method:** `POST`

**Headers:**

- Content-Type: `application/json`
- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiJGaFViTlM0RVdNU3JZS3g4NjBtTk5nIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6InQ1WjNwUFNHbzQzNzMyNVlSOV8zb2ciLCJleHBpcnkiOiIxNzMzMzE5NzE4IiwidWlkIjoiZWNvc3RhQGV4YW1wbGUuY29tIn0=`
**Body:**
```json
{ 
    "name": "Carolina",
    "email": "carol@email.com",
    "password": "monitorlg",
    "confirm_password": "monitorlg",
    "confirm_success_url": "www.google.com"
}

```

**Exemplo de Resposta (Criar User):**

- **Status:** 200 OK

```json
{
    "status": "success",
    "data": {
        "id": 11,
        "email": "carol@email.com",
        "created_at": "2024-11-20T14:46:20.273Z",
        "updated_at": "2024-11-20T14:46:20.273Z",
        "name": "Carolina",
        "role": "user",
        "admin": false,
        "provider": "email",
        "uid": "carol@email.com",
        "allow_password_change": false
    }
}
```

#### Atualizar Usuário

**Descrição:** Requisição que me permite alterar o nome ou algum campo do usuário.

**URL:** `http://localhost:3000/users/:id`

**Method:** `PATCH`

**Headers:**

- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiJGaFViTlM0RVdNU3JZS3g4NjBtTk5nIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6InQ1WjNwUFNHbzQzNzMyNVlSOV8zb2ciLCJleHBpcnkiOiIxNzMzMzE5NzE4IiwidWlkIjoiZWNvc3RhQGV4YW1wbGUuY29tIn0=`
- Content-Type: `application/json`
**Body:**
```json
{
    "name": "Carol"
}
```

**Exemplo de Resposta (Atualizar Usuário):**

- **Status:** 200 OK

```json
{
    "name": "Carol",
    "email": "carol@email.com",
    "role": "user",
    "admin": false,
    "created_at": "20/11/2024 14:46",
    "updated_at": "20/11/2024 14:47"
}
```

#### Listar todos os Usuarios

**Descrição:** Com o usuário admin, ele lista todos os usuários do sistema.

**URL:** `http://localhost:3000/users`

**Method:** `GET`

**Headers:**

- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiJJWUdrZ1BETG9NR1BPZ214MFFfT3JRIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6InRCMDRYbll0TTZKTVhzY2lzUVA3N2ciLCJleHBpcnkiOiIxNzMzMzIzNjE1IiwidWlkIjoiZWNvc3RhQGV4YW1wbGUuY29tIn0=`
**Exemplo de Resposta (Listar todos os Usuarios):**

- **Status:** 200 OK

```json
[
    {
        "name": "Joao Borbosa",
        "email": "jbarbosa@example.com",
        "role": "admin",
        "admin": true,
        "created_at": "20/11/2024 14:45",
        "updated_at": "20/11/2024 14:45"
    },
    {
        "name": "Jose de Arimateia",
        "email": "jarimateia@example.com",
        "role": "user",
        "admin": false,
        "created_at": "20/11/2024 14:45",
        "updated_at": "20/11/2024 14:45"
    },
    {
        "name": "Marina Aragao",
        "email": "maragao@example.com",
        "role": "user",
        "admin": false,
        "created_at": "20/11/2024 14:45",
        "updated_at": "20/11/2024 14:45"
    },
    {
        "name": "Roberto Freitas",
        "email": "rfreitas@example.com",
        "role": "user",
        "admin": false,
        "created_at": "20/11/2024 14:45",
        "updated_at": "20/11/2024 14:45"
    },
    {
        "name": "Josefa Perreira",
        "email": "jperreira@example.com",
        "role": "user",
        "admin": false,
        "created_at": "20/11/2024 14:45",
        "updated_at": "20/11/2024 14:45"
    },
    {
        "name": "Frederico Evandro",
        "email": "fevandro@example.com",
        "role": "admin",
        "admin": true,
        "created_at": "20/11/2024 14:45",
        "updated_at": "20/11/2024 14:45"
    },
    {
        "name": "Sivirino Valentin",
        "email": "svalentin@example.com",
        "role": "user",
        "admin": false,
        "created_at": "20/11/2024 14:45",
        "updated_at": "20/11/2024 14:45"
    },
    {
        "name": "Raimunda Ferreira",
        "email": "rferreira@example.com",
        "role": "user",
        "admin": true,
        "created_at": "20/11/2024 14:45",
        "updated_at": "20/11/2024 14:45"
    },
    {
        "name": "Manuel da Silva",
        "email": "msilva@example.com",
        "role": "admin",
        "admin": false,
        "created_at": "20/11/2024 14:45",
        "updated_at": "20/11/2024 14:45"
    },
    {
        "name": "Eduardo Costa",
        "email": "ecosta@example.com",
        "role": "admin",
        "admin": true,
        "created_at": "20/11/2024 14:45",
        "updated_at": "20/11/2024 14:46"
    },
    {
        "name": "Carol",
        "email": "carol@email.com",
        "role": "user",
        "admin": false,
        "created_at": "20/11/2024 14:46",
        "updated_at": "20/11/2024 14:47"
    }
]
```

#### Buscar um Usuario

**Descrição:** Com a conta de administrador, é possível acessar qualquer ID, enquanto um usuário comum possui acesso restrito apenas ao seu respectivo ID

**URL:** `http://localhost:3000/users/:id`

**Method:** `GET`

**Headers:**

- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiJJWUdrZ1BETG9NR1BPZ214MFFfT3JRIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6InRCMDRYbll0TTZKTVhzY2lzUVA3N2ciLCJleHBpcnkiOiIxNzMzMzIzNjE1IiwidWlkIjoiZWNvc3RhQGV4YW1wbGUuY29tIn0=`
**Exemplo de Resposta (Buscar um Usuario):**

- **Status:** 200 OK

```json
{
    "name": "Carol",
    "email": "carol@email.com",
    "role": "user",
    "admin": false,
    "created_at": "20/11/2024 14:46",
    "updated_at": "20/11/2024 14:47"
}
```

#### Excluir um Usuario

**Descrição:** Com administrador deleta qualquer usuário.

**URL:** `http://localhost:3000/users/:id`

**Method:** `DELETE`

**Headers:**

- Content-Type: `application/json`
- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiJJWUdrZ1BETG9NR1BPZ214MFFfT3JRIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6InRCMDRYbll0TTZKTVhzY2lzUVA3N2ciLCJleHBpcnkiOiIxNzMzMzIzNjE1IiwidWlkIjoiZWNvc3RhQGV4YW1wbGUuY29tIn0=`
**Exemplo de Resposta (Excluir um Usuario):**

- **Status:** N/A N/A

---

### Invoice

#### Criar Nota Fiscal

**URL:** `http://localhost:3000/invoices`

**Method:** `POST`

**Headers:**

- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiJJWUdrZ1BETG9NR1BPZ214MFFfT3JRIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6InRCMDRYbll0TTZKTVhzY2lzUVA3N2ciLCJleHBpcnkiOiIxNzMzMzIzNjE1IiwidWlkIjoiZWNvc3RhQGV4YW1wbGUuY29tIn0=`
**Exemplo de Resposta (Criar Nota Fiscal):**

- **Status:** 201 Created

```json
{
    "id": 53,
    "user_id": 10,
    "invoice_number": "INV123460",
    "purchase_date": "2023-05-31",
    "issue_date": "2024-06-01",
    "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBPZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--57167c7594c31ed5034fb2fb506a859357fe69ba/testeinvoice3.pdf"
}
```

#### Atualizar Nota Fiscal

**URL:** `http://localhost:3000/invoices/:id`

**Method:** `PATCH`

**Headers:**

- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiJJWUdrZ1BETG9NR1BPZ214MFFfT3JRIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6InRCMDRYbll0TTZKTVhzY2lzUVA3N2ciLCJleHBpcnkiOiIxNzMzMzIzNjE1IiwidWlkIjoiZWNvc3RhQGV4YW1wbGUuY29tIn0=`
- Accept-Language: `pt-BR`
**Exemplo de Resposta (Atualizar Nota Fiscal):**

- **Status:** 200 OK

```json
{
    "id": 53,
    "user_id": 10,
    "invoice_number": "INV123460",
    "purchase_date": "2023-07-31",
    "issue_date": "2024-08-10",
    "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBPZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--57167c7594c31ed5034fb2fb506a859357fe69ba/testeinvoice3.pdf"
}
```

#### Listar Todas As Notas Fiscais

**URL:** `http://localhost:3000/invoices/`

**Method:** `GET`

**Headers:**

- Accept-Language: `pt-BR`
- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiJJWUdrZ1BETG9NR1BPZ214MFFfT3JRIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6InRCMDRYbll0TTZKTVhzY2lzUVA3N2ciLCJleHBpcnkiOiIxNzMzMzIzNjE1IiwidWlkIjoiZWNvc3RhQGV4YW1wbGUuY29tIn0=`
**Exemplo de Resposta (Listar Todas As Notas Fiscais):**

- **Status:** 200 OK

```json
[
    {
        "id": 1,
        "user_id": 1,
        "invoice_number": "INV0001",
        "purchase_date": "2024-11-01",
        "issue_date": "2024-11-02",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--23be61df65ce93ec2258350c144f906a933fb56a/invoice.pdf"
    },
    {
        "id": 2,
        "user_id": 1,
        "invoice_number": "INV0002",
        "purchase_date": "2024-10-31",
        "issue_date": "2024-10-31",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--45ce44e579279952937396204fd4526a663618fb/invoice.pdf"
    },
    {
        "id": 3,
        "user_id": 1,
        "invoice_number": "INV0003",
        "purchase_date": "2024-10-28",
        "issue_date": "2024-10-29",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBDQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--2ea1b74b7134400fbfa7265e49e61c0a8f1de79a/invoice.pdf"
    },
    {
        "id": 4,
        "user_id": 4,
        "invoice_number": "INV0004",
        "purchase_date": "2024-10-21",
        "issue_date": "2024-10-21",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBDUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--05fe7f4a22e260f24e823cee66147cb89de0b711/invoice.pdf"
    },
    {
        "id": 5,
        "user_id": 1,
        "invoice_number": "INV0005",
        "purchase_date": "2024-11-04",
        "issue_date": "2024-11-04",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBDZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--69668cc0e694b5d98359ba5833d1140ea2fffeb3/invoice.pdf"
    },
    {
        "id": 6,
        "user_id": 6,
        "invoice_number": "INV0006",
        "purchase_date": "2024-10-27",
        "issue_date": "2024-10-28",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBDdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--be2f143257c88340f0e44364096359c4438090af/invoice.pdf"
    },
    {
        "id": 7,
        "user_id": 7,
        "invoice_number": "INV0007",
        "purchase_date": "2024-11-02",
        "issue_date": "2024-11-03",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBEQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--6b9da2a83fc338b2b0d79006ed17b5c91f8dbf0c/invoice.pdf"
    },
    {
        "id": 8,
        "user_id": 7,
        "invoice_number": "INV0008",
        "purchase_date": "2024-11-08",
        "issue_date": "2024-11-09",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBEUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--90faa95fb0266b8ba6ac4eee930b6c536f21a578/invoice.pdf"
    },
    {
        "id": 9,
        "user_id": 2,
        "invoice_number": "INV0009",
        "purchase_date": "2024-11-08",
        "issue_date": "2024-11-09",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBEZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--19efaa7fc64f806fe1676f2bbf86460999038fe5/invoice.pdf"
    },
    {
        "id": 10,
        "user_id": 1,
        "invoice_number": "INV0010",
        "purchase_date": "2024-11-05",
        "issue_date": "2024-11-05",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBEdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--ad29f1e215630c00e8fe9ba694c90b00e5303840/invoice.pdf"
    },
    {
        "id": 11,
        "user_id": 2,
        "invoice_number": "INV0011",
        "purchase_date": "2024-11-07",
        "issue_date": "2024-11-08",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBFQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--f05f6ca88762090cce913177ec9d55adeaf277d1/invoice.pdf"
    },
    {
        "id": 12,
        "user_id": 7,
        "invoice_number": "INV0012",
        "purchase_date": "2024-10-23",
        "issue_date": "2024-10-24",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBFUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--c6460bcd8228ddceb5d375105c4b7d90d338f35a/invoice.pdf"
    },
    {
        "id": 13,
        "user_id": 4,
        "invoice_number": "INV0013",
        "purchase_date": "2024-11-04",
        "issue_date": "2024-11-04",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBFZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--065f41a28157389bc5a8c301071cbfe9ca862507/invoice.pdf"
    },
    {
        "id": 14,
        "user_id": 7,
        "invoice_number": "INV0014",
        "purchase_date": "2024-10-25",
        "issue_date": "2024-10-26",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBFdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--bdcc8f04856baf5dbc7f0c2baa808b1bc786f33f/invoice.pdf"
    },
    {
        "id": 15,
        "user_id": 7,
        "invoice_number": "INV0015",
        "purchase_date": "2024-10-21",
        "issue_date": "2024-10-21",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBGQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--5507b62655933763477af5dbdf4c9e01a84409d6/invoice.pdf"
    },
    {
        "id": 16,
        "user_id": 1,
        "invoice_number": "INV0016",
        "purchase_date": "2024-10-23",
        "issue_date": "2024-10-23",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBGUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--fd742809a7fa8e122f0c36bc74b5b7ede73f8f61/invoice.pdf"
    },
    {
        "id": 17,
        "user_id": 4,
        "invoice_number": "INV0017",
        "purchase_date": "2024-11-09",
        "issue_date": "2024-11-09",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBGZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--1f192ca47828e4a5c1726420aaf179337b7ea9de/invoice.pdf"
    },
    {
        "id": 18,
        "user_id": 7,
        "invoice_number": "INV0018",
        "purchase_date": "2024-11-02",
        "issue_date": "2024-11-02",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBGdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--d877ff7b00be22dc88f8c242cfd5de3b00d16c4c/invoice.pdf"
    },
    {
        "id": 19,
        "user_id": 5,
        "invoice_number": "INV0019",
        "purchase_date": "2024-11-02",
        "issue_date": "2024-11-03",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBHQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--6fc8b61d847776fe80cd62e744990fcd5b7970b3/invoice.pdf"
    },
    {
        "id": 20,
        "user_id": 7,
        "invoice_number": "INV0020",
        "purchase_date": "2024-11-08",
        "issue_date": "2024-11-08",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBHUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--2d65cb82ba1d64354b242ea981aa7c08e37c4f42/invoice.pdf"
    },
    {
        "id": 21,
        "user_id": 5,
        "invoice_number": "INV0021",
        "purchase_date": "2024-10-29",
        "issue_date": "2024-10-30",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBHZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--41c7bede405d75ce5c00e4c1737dd9bd01ed0b7e/invoice.pdf"
    },
    {
        "id": 22,
        "user_id": 5,
        "invoice_number": "INV0022",
        "purchase_date": "2024-11-06",
        "issue_date": "2024-11-07",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBHdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--33462c913467f17a21fcaffc2064eb2d6bce27c4/invoice.pdf"
    },
    {
        "id": 23,
        "user_id": 1,
        "invoice_number": "INV0023",
        "purchase_date": "2024-10-28",
        "issue_date": "2024-10-28",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBIQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--d2e9de04c08e93f11b20c8a5dd39b5d1d49a294b/invoice.pdf"
    },
    {
        "id": 24,
        "user_id": 1,
        "invoice_number": "INV0024",
        "purchase_date": "2024-10-24",
        "issue_date": "2024-10-25",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBIUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--e3079312c273a9f01cfa1bde99d747723ff6701a/invoice.pdf"
    },
    {
        "id": 25,
        "user_id": 2,
        "invoice_number": "INV0025",
        "purchase_date": "2024-11-03",
        "issue_date": "2024-11-03",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBIZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--13289e5be37c94f0b01039bfbbef6bf7471da58b/invoice.pdf"
    },
    {
        "id": 26,
        "user_id": 4,
        "invoice_number": "INV0026",
        "purchase_date": "2024-11-06",
        "issue_date": "2024-11-07",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBIdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--26a6d3a4d629d8a98edd27b7128e380728ccff8e/invoice.pdf"
    },
    {
        "id": 27,
        "user_id": 6,
        "invoice_number": "INV0027",
        "purchase_date": "2024-11-10",
        "issue_date": "2024-11-11",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBJQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--888b68f1d87155657da7a32d5b874db0d214d5f7/invoice.pdf"
    },
    {
        "id": 28,
        "user_id": 2,
        "invoice_number": "INV0028",
        "purchase_date": "2024-11-06",
        "issue_date": "2024-11-06",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBJUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--6aea783714583f86869b00434bbba202a2d6aa7c/invoice.pdf"
    },
    {
        "id": 29,
        "user_id": 2,
        "invoice_number": "INV0029",
        "purchase_date": "2024-11-08",
        "issue_date": "2024-11-09",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBJZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--107a67f9c2098fda0f605932a024ea3ba3a6dcf8/invoice.pdf"
    },
    {
        "id": 30,
        "user_id": 5,
        "invoice_number": "INV0030",
        "purchase_date": "2024-11-01",
        "issue_date": "2024-11-02",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBJdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--7fdc11c5f478f2b7c21ef7f10f24743e28244edd/invoice.pdf"
    },
    {
        "id": 31,
        "user_id": 1,
        "invoice_number": "INV0031",
        "purchase_date": "2024-11-02",
        "issue_date": "2024-11-02",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBKQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--e60336a1be877cae398a7ff0179bac7579cc25f3/invoice.pdf"
    },
    {
        "id": 32,
        "user_id": 5,
        "invoice_number": "INV0032",
        "purchase_date": "2024-11-02",
        "issue_date": "2024-11-03",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBKUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--13bc6bf7d28ede68ef2e62af52887a7b4904e4fa/invoice.pdf"
    },
    {
        "id": 33,
        "user_id": 6,
        "invoice_number": "INV0033",
        "purchase_date": "2024-10-30",
        "issue_date": "2024-10-30",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBKZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--c81b4444ddc65413a11446266e8138d686a6670f/invoice.pdf"
    },
    {
        "id": 34,
        "user_id": 5,
        "invoice_number": "INV0034",
        "purchase_date": "2024-10-27",
        "issue_date": "2024-10-27",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBKdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--8ae00ee302e8275867e9d050fcd95bcbc33ba3a6/invoice.pdf"
    },
    {
        "id": 35,
        "user_id": 1,
        "invoice_number": "INV0035",
        "purchase_date": "2024-10-25",
        "issue_date": "2024-10-25",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBLQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--5ac92f9f1e9f2a03cd65e4529daeabb99ad3d03f/invoice.pdf"
    },
    {
        "id": 36,
        "user_id": 1,
        "invoice_number": "INV0036",
        "purchase_date": "2024-10-30",
        "issue_date": "2024-10-31",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBLUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--4cf3396a8f5ca49fa55be185ed5234088ebb9f38/invoice.pdf"
    },
    {
        "id": 37,
        "user_id": 5,
        "invoice_number": "INV0037",
        "purchase_date": "2024-11-04",
        "issue_date": "2024-11-04",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBLZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--479c56451b884e4ba0a48d5bb3e0f0676b0c9ce3/invoice.pdf"
    },
    {
        "id": 38,
        "user_id": 1,
        "invoice_number": "INV0038",
        "purchase_date": "2024-11-01",
        "issue_date": "2024-11-02",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBLdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--d0a20dbd7319f19e16e53758b728cd098bb018e7/invoice.pdf"
    },
    {
        "id": 39,
        "user_id": 7,
        "invoice_number": "INV0039",
        "purchase_date": "2024-10-29",
        "issue_date": "2024-10-30",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBMQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--29aab2abd1ade46633d0ba88fd5d7cd0e3c18e29/invoice.pdf"
    },
    {
        "id": 40,
        "user_id": 5,
        "invoice_number": "INV0040",
        "purchase_date": "2024-11-09",
        "issue_date": "2024-11-10",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBMUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--9f10229349e87371e7ad6d408b18bb03c55bf089/invoice.pdf"
    },
    {
        "id": 41,
        "user_id": 1,
        "invoice_number": "INV0041",
        "purchase_date": "2024-10-31",
        "issue_date": "2024-11-01",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBMZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--57f88888d48f286b718f84f61b15737b3ba90557/invoice.pdf"
    },
    {
        "id": 42,
        "user_id": 2,
        "invoice_number": "INV0042",
        "purchase_date": "2024-10-29",
        "issue_date": "2024-10-29",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBMdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--727e58cf038d51e76760aea1e32698839087f36e/invoice.pdf"
    },
    {
        "id": 43,
        "user_id": 5,
        "invoice_number": "INV0043",
        "purchase_date": "2024-11-02",
        "issue_date": "2024-11-03",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBNQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--e1f9c1c1493e95ebd3ef49be048d1e2716aed9c6/invoice.pdf"
    },
    {
        "id": 44,
        "user_id": 6,
        "invoice_number": "INV0044",
        "purchase_date": "2024-10-27",
        "issue_date": "2024-10-27",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBNUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--8cad202d2f3b22987deda722c3f18880c1f49254/invoice.pdf"
    },
    {
        "id": 45,
        "user_id": 3,
        "invoice_number": "INV0045",
        "purchase_date": "2024-11-09",
        "issue_date": "2024-11-10",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBNZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--4c7e498f8b62f414573312c6bf1292fe7fe32efc/invoice.pdf"
    },
    {
        "id": 46,
        "user_id": 6,
        "invoice_number": "INV0046",
        "purchase_date": "2024-10-21",
        "issue_date": "2024-10-21",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBNdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--9301e37f9f27412a6c02846f163f6f201d194a33/invoice.pdf"
    },
    {
        "id": 47,
        "user_id": 7,
        "invoice_number": "INV0047",
        "purchase_date": "2024-11-02",
        "issue_date": "2024-11-03",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBOQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--78dc47a9a3482c0096756116ecc5a703616bb2a6/invoice.pdf"
    },
    {
        "id": 48,
        "user_id": 7,
        "invoice_number": "INV0048",
        "purchase_date": "2024-11-07",
        "issue_date": "2024-11-07",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBOUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--7aadf1167e848e15c3e9ca8f38dc474451f8c58e/invoice.pdf"
    },
    {
        "id": 49,
        "user_id": 4,
        "invoice_number": "INV0049",
        "purchase_date": "2024-10-24",
        "issue_date": "2024-10-24",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBOZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--acef31dfa081fb0a1f717834c58264cc1650f2e3/invoice.pdf"
    },
    {
        "id": 50,
        "user_id": 6,
        "invoice_number": "INV0050",
        "purchase_date": "2024-10-25",
        "issue_date": "2024-10-25",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBOdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--75696ccab3314dfdd348cdcd305ef65f18190bf7/invoice.pdf"
    },
    {
        "id": 51,
        "user_id": 10,
        "invoice_number": "INV123458",
        "purchase_date": "2023-05-31",
        "issue_date": "2024-06-01",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBPQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--2dc767eb2ea32bbb7cf2ce788385db9b145a47aa/testeinvoice3.pdf"
    },
    {
        "id": 52,
        "user_id": 10,
        "invoice_number": "INV123460",
        "purchase_date": "2023-05-31",
        "issue_date": "2024-06-01",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBPUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--6b2f34c75a2761dcae58e739cdc3d0d47228e0ec/testeinvoice3.pdf"
    },
    {
        "id": 53,
        "user_id": 10,
        "invoice_number": "INV123460",
        "purchase_date": "2023-07-31",
        "issue_date": "2024-08-10",
        "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBPZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--57167c7594c31ed5034fb2fb506a859357fe69ba/testeinvoice3.pdf"
    }
]
```

#### Buscar Uma Nota Fiscal

**URL:** `http://localhost:3000/invoices/:id`

**Method:** `GET`

**Headers:**

- Accept-Language: `pt-BR`
- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiJid2JsQ2NycHlLRWxEamdqNTVPQktnIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6ImtTczZlVzRCNTBIQ2FpSXhhZVpEd1EiLCJleHBpcnkiOiIxNzMzMzE3MzkwIiwidWlkIjoiZWNvc3RhQGV4YW1wbGUuY29tIn0=`
**Exemplo de Resposta (Buscar Uma Nota Fiscal):**

- **Status:** 200 OK

```json
{
    "id": 53,
    "user_id": 10,
    "invoice_number": "INV123460",
    "purchase_date": "2023-07-31",
    "issue_date": "2024-08-10",
    "pdf_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBPZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--57167c7594c31ed5034fb2fb506a859357fe69ba/testeinvoice3.pdf"
}
```

#### Excluir uma Nota Fiscal

**URL:** `http://localhost:3000/invoices/:id`

**Method:** `DELETE`

**Headers:**

- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiJJWUdrZ1BETG9NR1BPZ214MFFfT3JRIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6InRCMDRYbll0TTZKTVhzY2lzUVA3N2ciLCJleHBpcnkiOiIxNzMzMzIzNjE1IiwidWlkIjoiZWNvc3RhQGV4YW1wbGUuY29tIn0=`
- Accept-Language: `pt-BR`
**Exemplo de Resposta (Excluir uma Nota Fiscal):**

- **Status:** N/A N/A

---

### Product

#### Criar Produto

**URL:** `http://localhost:3000/products`

**Method:** `POST`

**Headers:**

- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiJuelBMWFlfSzJOR2xnVXZQYWFON2lnIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6ImQyUGVKdURQQlhFWHpnZVlXZzhkVVEiLCJleHBpcnkiOiIxNzMzMTg0NzM2IiwidWlkIjoiamFyaW1hdGVpYUBleGFtcGxlLmNvbSJ9`
- Content-Type: `application/json`
**Body:**
```json
{
  "product": {
    "name": "Nome do Produto 106",
    "description": "Descrição do 106",
    "category": 1,
    "price": 100,
    "serial_number": "SN12345",
    "warranty_expiry_date": "2025-12-31",
    "store_id": 1,
    "invoice_id": 1
  }
}

```

#### Autalizar Produto

**URL:** `http://localhost:3000/products/:id`

**Method:** `PATCH`

**Headers:**

- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiJJNTJBN2RSVjJlSHpDQVVvdHdBazVnIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6Inc3ZFBYRGNWYnl0bGNLSVN3OUUwYnciLCJleHBpcnkiOiIxNzMzMTYyODkyIiwidWlkIjoiemVsZXppbUBleGFtcGxlLmNvbSJ9`
- Accept-Language: `pt-BR`
#### Listar Todas Os Produtos

**URL:** `http://localhost:3000/products/`

**Method:** `GET`

**Headers:**

- Accept-Language: `pt-BR`
- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiJJNTJBN2RSVjJlSHpDQVVvdHdBazVnIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6Inc3ZFBYRGNWYnl0bGNLSVN3OUUwYnciLCJleHBpcnkiOiIxNzMzMTYyODkyIiwidWlkIjoiemVsZXppbUBleGFtcGxlLmNvbSJ9`
#### Busca Um Produtos

**URL:** `http://localhost:3000/products/:id`

**Method:** `GET`

**Headers:**

- Accept-Language: `pt-BR`
- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiJid2JsQ2NycHlLRWxEamdqNTVPQktnIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6ImtTczZlVzRCNTBIQ2FpSXhhZVpEd1EiLCJleHBpcnkiOiIxNzMzMzE3MzkwIiwidWlkIjoiZWNvc3RhQGV4YW1wbGUuY29tIn0=`
#### Excluir Um Produto

**URL:** `http://localhost:3000/products/:id`

**Method:** `DELETE`

**Headers:**

- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiJJNTJBN2RSVjJlSHpDQVVvdHdBazVnIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6Inc3ZFBYRGNWYnl0bGNLSVN3OUUwYnciLCJleHBpcnkiOiIxNzMzMTYyODkyIiwidWlkIjoiemVsZXppbUBleGFtcGxlLmNvbSJ9`
- Accept-Language: `pt-BR`
---

### Store

#### Criar Loja

**URL:** `http://localhost:3000/stores/`

**Method:** `POST`

**Headers:**

- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiI2RWpFNzhNdDQ5ZXZnSi1NdXF4X2l3IiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6Ii1WQjdjOHozUnRNaGlhWmdFS3JuSnciLCJleHBpcnkiOiIxNzMyNzA4NTI2IiwidWlkIjoiZHUuZHVkdS5lZHVAZXhhbXBsZS5jb20ifQ==`
**Body:**
```json
{
    "name": "sabere",
    "address": "av capoeira, 201a, olinda pe",
    "contact": "sabere@gmail.com"
}



```

#### Atualizar Loja

**URL:** `http://localhost:3000/stores/:id`

**Method:** `PATCH`

**Headers:**

- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiJoRzI2SlhucDZfcUR5cFpzU0pfRnhnIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6ImsyU1RxZ0N6YkMxNExwQXQ5MXhWUFEiLCJleHBpcnkiOiIxNzMyMTM1MTYwIiwidWlkIjoiemVsZXppbUBleGFtcGxlLmNvbSJ9`
- Accept-Language: `pt-BR`
#### Listar Todas As Lojas

**URL:** `http://localhost:3000/stores`

**Method:** `GET`

**Headers:**

- Accept-Language: `pt-BR`
- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiJoYzlYYkJ2VjJwcnEyV1R3NkdiSFRnIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6InVheDNxd2RRaThmTHV2WW1PX2FTWFEiLCJleHBpcnkiOiIxNzMyNzA4MTk2IiwidWlkIjoiemVsZXppbUBleGFtcGxlLmNvbSJ9`
#### Buscar Uma Loja

**URL:** `http://localhost:3000/stores/:id`

**Method:** `GET`

**Headers:**

- Accept-Language: `pt-BR`
- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiJoYzlYYkJ2VjJwcnEyV1R3NkdiSFRnIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6InVheDNxd2RRaThmTHV2WW1PX2FTWFEiLCJleHBpcnkiOiIxNzMyNzA4MTk2IiwidWlkIjoiemVsZXppbUBleGFtcGxlLmNvbSJ9`
#### Excluir Uma Loja

**URL:** `http://localhost:3000/stores/`

**Method:** `DELETE`

**Headers:**

- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiI2RWpFNzhNdDQ5ZXZnSi1NdXF4X2l3IiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6Ii1WQjdjOHozUnRNaGlhWmdFS3JuSnciLCJleHBpcnkiOiIxNzMyNzA4NTI2IiwidWlkIjoiZHUuZHVkdS5lZHVAZXhhbXBsZS5jb20ifQ==`
- Accept-Language: `pt-BR`
---

### Warranty

#### Criar Warranty

**URL:** `http://localhost:3000/warranties/`

**Method:** `POST`

**Headers:**

- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiI2RWpFNzhNdDQ5ZXZnSi1NdXF4X2l3IiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6Ii1WQjdjOHozUnRNaGlhWmdFS3JuSnciLCJleHBpcnkiOiIxNzMyNzA4NTI2IiwidWlkIjoiZHUuZHVkdS5lZHVAZXhhbXBsZS5jb20ifQ==`
**Body:**
```json



```

#### Atualizar Warranty

**URL:** `http://localhost:3000/warranties/:id`

**Method:** `PATCH`

**Headers:**

- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiJoRzI2SlhucDZfcUR5cFpzU0pfRnhnIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6ImsyU1RxZ0N6YkMxNExwQXQ5MXhWUFEiLCJleHBpcnkiOiIxNzMyMTM1MTYwIiwidWlkIjoiemVsZXppbUBleGFtcGxlLmNvbSJ9`
- Accept-Language: `pt-BR`
#### Listar Todas Warranty

**URL:** `http://localhost:3000/warranties`

**Method:** `GET`

**Headers:**

- Accept-Language: `pt-BR`
- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiJyd28ybUt4WFhkZGtORHNRV0Qyc0F3IiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6IkUxZ215SnJmdWNpM09waTNhdlhDY0EiLCJleHBpcnkiOiIxNzMyNzk2MTUwIiwidWlkIjoiemVsZXppbUBleGFtcGxlLmNvbSJ9`
#### Buscar Uma Warranty

**URL:** `http://localhost:3000/warranties/:id`

**Method:** `GET`

**Headers:**

- Accept-Language: `pt-BR`
- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiJoYzlYYkJ2VjJwcnEyV1R3NkdiSFRnIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6InVheDNxd2RRaThmTHV2WW1PX2FTWFEiLCJleHBpcnkiOiIxNzMyNzA4MTk2IiwidWlkIjoiemVsZXppbUBleGFtcGxlLmNvbSJ9`
#### Excluir Uma Warranty

**URL:** `http://localhost:3000/warranties/:id`

**Method:** `DELETE`

**Headers:**

- Authorization: `Bearer eyJhY2Nlc3MtdG9rZW4iOiI2RWpFNzhNdDQ5ZXZnSi1NdXF4X2l3IiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6Ii1WQjdjOHozUnRNaGlhWmdFS3JuSnciLCJleHBpcnkiOiIxNzMyNzA4NTI2IiwidWlkIjoiZHUuZHVkdS5lZHVAZXhhbXBsZS5jb20ifQ==`
- Accept-Language: `pt-BR`
---
