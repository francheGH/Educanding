class CreateFaculties < ActiveRecord::Migration[5.1]
  def change
    create_table :faculties do |t|
      t.string :universidad
      t.string :facultad
      t.string :provincia
      t.string :ciudad

      t.timestamps
    end
  end
end
