class UserSerializer < ApplicationSerializer
  def self.call(user)
    base_data = {
      name: user.name,
      email: user.email,
      role: user.role,
      admin: user.admin
    }

    base_data.merge(serialize_timestamps(user))
  end
end
