class WarrantyPolicy < ApplicationPolicy
  def index?
    user.admin? || user_owns_warranty?
  end

  def show?
    user.admin? || user_owns_warranty?
  end

  def create?
    return user.admin? if record.is_a?(Class)

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

  private

  def user_owns_warranty?
    record.product.invoice.user == user
  end

  def user_has_access_to_product?
    product = record.product || Product.find_by(id: permitted_attributes(Warranty)[:product_id])
    product&.invoice&.user == user
  end
end
