class ProductPolicy < ApplicationPolicy
  # Define o escopo de acesso (usado em index)
  class Scope < Scope
    def resolve
      if user.admin?
        # Admin pode acessar todos os produtos
        scope.all
      else
        # Usuário comum acessa produtos relacionados aos seus invoices
        scope.joins(:invoice).where(invoices: { user_id: user.id })
      end
    end
  end

  # Permite visualizar um produto
  def show?
    user.admin? || user.invoices.exists?(id: record.invoice_id)
  end

  # Permite listar os produtos
  def index?
    user.admin? || user_has_access_to_products?
  end

  # Permite criar um produto
  def create?
    user.admin? || user.invoices.exists?(id: record.invoice_id)
  end

  # Permite atualizar um produto
  def update?
    user.admin? || user.invoices.exists?(id: record.invoice_id)
  end

  # Permite deletar um produto
  def destroy?
    user.admin? || user.invoices.exists?(id: record.invoice_id)
  end

  # Permissões de atributos permitidos
  def permitted_attributes
    if record.new_record? # Verifica se é uma criação
      [:name, :description, :category, :price, :serial_number, :warranty_expiry_date, :store_id, :invoice_id]
    else # Se não for criação, é atualização
      [:name, :description, :category, :price, :serial_number, :warranty_expiry_date, :store_id]
    end
  end

  private

  # Verifica se o usuário possui acesso a qualquer produto (via invoices)
  def user_has_access_to_products?
    user.invoices.joins(:products).exists?
  end

end
