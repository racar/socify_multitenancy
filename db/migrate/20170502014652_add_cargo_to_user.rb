class AddCargoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :cargo, :string
  end
end
