class WarrantyPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if product.admin?
        scope.all
      else
        scope.where(product_id: product.id)
      end
    end

    def index?
      product.admin?
    end

    def show?
      product.admin? || record.product_id == product.id
    end

    def create?
      product.present?
    end

    def update?
      if product.admin?
        true
      else
        product.role == 'product' && record.product_id == product.id
      end
    end

    def destroy?
      product.admin?
    end

    def permitted_attributes
      [:warranty_number, :issue_date, :expirity_date, :role, :admin, :validity_period, { presence: true }]
    end
  end
end
