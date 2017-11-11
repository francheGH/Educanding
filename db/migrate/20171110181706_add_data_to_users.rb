class AddDataToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nombre, :string
    add_column :users, :apellido, :string
    add_column :users, :edad, :integer
    add_column :users, :sexo, :string
  end
end
