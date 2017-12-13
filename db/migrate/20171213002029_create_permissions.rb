class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.string :nombre
      t.integer :puntos

      t.timestamps
    end
  end
end
