class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        # Usuário comum acessa produtos relacionados aos seus invoices
        scope.joins(:invoice).where(invoices: { user_id: user.id })
      end
    end
  end

  def show?
    user.admin? || user.invoices.exists?(id: record.invoice_id)
  end

  def index?
    user.admin? || user_has_access_to_products?
  end

  def create?
    user.admin? || user.invoices.exists?(id: record.invoice_id)
  end

  def update?
    user.admin? || user.invoices.exists?(id: record.invoice_id)
  end

  def destroy?
    user.admin? || user.invoices.exists?(id: record.invoice_id)
  end

  def permitted_attributes
    if record.new_record? # Verifica se é uma criação
      [:name, :description, :category, :price, :serial_number, :warranty_expiry_date, :store_id, :invoice_id]
    else # Se não for criação, não passa o invoice_id
      [:name, :description, :category, :price, :serial_number, :warranty_expiry_date, :store_id]
    end
  end

  private

  def user_has_access_to_products?
    user.invoices.joins(:products).exists?
  end

end
