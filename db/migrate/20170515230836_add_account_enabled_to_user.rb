class AddAccountEnabledToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :account_enabled, :boolean
  end
end
