class ChangeEdadFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :edad
    add_column :users, :fechaNacimiento, :date    
  end
end
