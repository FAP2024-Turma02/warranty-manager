class WarrantyPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end

    def index?
      user.admin?
    end

    def show?
      user.admin? || record.user_id == user.id
    end

    def create?
      user.present?
    end

    def update?
      if user.admin?
        true
      else
        user.role == 'user' && record.user_id == user.id
      end
    end

    def destroy?
      user.admin?
    end

    def permitted_attributes
      [:warranty_number, :issue_date, :expirity_date, :role, :admin, :validity_period, { presence: true }]
    end
  end
end
