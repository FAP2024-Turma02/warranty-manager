class InvoicePolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        if user.admin?
          scope.all
        else
          scope.where(user_id: user.id)
        end
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
      user.admin? || (user.role == 'user' && record.user_id == user.id)
    end
  
    def destroy?
      user.admin? || record.user_id == user.id
    end
  
    def permitted_attributes
      [:id, :invoice_number, :purchase_date, :issue_date, :pdf_url]
    end
  end
  