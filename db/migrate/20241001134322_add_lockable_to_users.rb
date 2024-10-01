class AddLockableToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :locked_at, :datetime
    add_column :users, :failed_attempts, :integer
    add_column :users, :unlock_token, :string
    add_column :users, :last_failed_login_at, :datetime
  end
end
