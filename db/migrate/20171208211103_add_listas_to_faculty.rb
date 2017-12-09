class AddListasToFaculty < ActiveRecord::Migration[5.1]
  def change
    add_column :faculties, :visitas, :integer, default: 0
    add_column :faculties, :cant_preguntas, :integer, default: 0
  end
end
