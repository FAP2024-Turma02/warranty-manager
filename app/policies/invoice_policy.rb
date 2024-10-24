class InvoicePolicy < ApplicationPolicy
    def create?
      user.admin? || user.id == record.user_id
    end
  
    def update?
      user.admin? || user.id == record.user_id
    end
  end
  