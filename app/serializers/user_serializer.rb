class UserSerializer < ActiveModel::Serializer

  attributes :id, :name, :email, :role, :admin, :created_at, :updated_at, :provider, :allow_password_change

  def role
    object.admin? ? 'admin' : 'user'
  end

  def created_at
    object.created_at.strftime("%Y-%m-%d %H:%M:%S")
  end

  def updated_at
    object.updated_at.strftime("%Y-%m-%d %H:%M:%S")
  end

  def provider
    object.provider || 'email'
  end
end
