class AddSubdomainToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :subdomain, :string
  end
end
