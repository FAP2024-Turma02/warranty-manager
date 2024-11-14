class WarrantyPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    user.admin? || user.products.exists?(id: record.product_id)
  end

  def create?
    user.present?
  end

  def update?
    if user.admin?
      true
    else
      user.role == 'product' && user.products.exists?(id: record.product_id)
    end
  end

  def destroy?
    user.admin?
  end

  def permitted_attributes
    [:warranty_number, :issue_date, :expirity_date, :role, :admin, :validity_period]
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(product_id: user.product_id)
      end
    end
  end
end
