class AddFacultadToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :facultad, :string
  end
end
