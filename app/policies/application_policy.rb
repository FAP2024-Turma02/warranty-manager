class ApplicationPolicy
  attr_reader :user, :record

  # Inicializa com o usuário atual e o registro ou escopo sendo acessado
  def initialize(user, record)
    @user = user
    @record = record
  end

  # Permissões padrão negadas
  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  # Aliases para new e edit
  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  # Classe Scope que exige definição de resolve em subclasses
  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end
end
