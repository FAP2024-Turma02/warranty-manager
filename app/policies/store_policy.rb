class StorePolicy < ApplicationPolicy 
    def index?
      true
    end
  
    def show?
      true
    end
  
    def create?
      user.present?
    end
  
    def update?
      user.admin?
    end
  
    def destroy?
      user.admin?
    end

    def permitted_attributes
        [:name, :contact, address]
    end
  
    class Scope < Scope
      def resolve
        scope.all
      end
    end
  end
