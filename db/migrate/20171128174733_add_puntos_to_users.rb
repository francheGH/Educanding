class AddPuntosToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :puntos, :integer, :default => 1, :greater_than => 0
  end
end
