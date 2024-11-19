class WarrantyPolicy < ApplicationPolicy
  
    def index?
      user.admin? || user_has_access_to_product?
    end
  
    def show?
      user.admin? || user_has_access_to_product?
    end
  
    def create?
      user.admin? || user_has_access_to_product?
    end
  
    def update?
      user.admin? || user_owns_warranty?
    end
  
    def destroy?
      user.admin? || user_owns_warranty?
    end
  
    class Scope < Scope
      def resolve
        if user.admin?
          scope.all
        else
          scope.joins(product: :invoice).where(invoices: { user_id: user.id })
        end
      end
    end

    def permitted_attributes
      if record.new_record? # Verifica se é uma criação
        [:warranty_number, :issue_date, :expirity_date, :validity_period, :product_id, :active]
      else # Se não for criação, é atualização
        [:warranty_number, :issue_date, :expirity_date, :validity_period, :active]
      end
    end
  
    private
  
    def user_has_access_to_warranty?
      record.product.invoice.user == user
    end
  
    def user_owns_warranty?
      record.product.invoice.user == user
    end
  
    def user_has_access_to_product?
      record.product.present? && record.product.invoice.user == user
    end
end
