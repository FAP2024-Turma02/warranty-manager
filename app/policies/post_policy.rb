class PostPolicy < ApplicationPolicy
  def index?
    user.present? # Permite se o usuário estiver autenticado
  end

  def show?
    user.present? && (record.user_id == user.id || user.admin?) # Permite se for o autor ou um administrador
  end

  # Adicione mais ações conforme necessário
end
