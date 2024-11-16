class WarrantyPolicy < ApplicationPolicy
    # Regra padrão para todos os métodos
    def index?
      true # Permite listar garantias para todos os usuários autenticados
    end
  
    def show?
      user_has_access_to_warranty?
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
          scope.joins(:product).where(products: { user_id: user.id }) 
        end
      end
    end
  
    private
  
    def user_has_access_to_warranty?
      # Verifica se o usuário tem acesso à garantia associada ao produto
      record.product.user == user
    end
  
    def user_owns_warranty?
      # Garante que o usuário seja dono do produto ao qual a garantia está associada
      record.product.user == user
    end
  
    def user_has_access_to_product?
      # Verifica se o usuário tem permissão para acessar o produto relacionado
      record.product.present? && record.product.user == user
    end
  end
  