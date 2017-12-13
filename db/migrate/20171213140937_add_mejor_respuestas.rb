class AddMejorRespuestas < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :mejorRespuesta, :boolean, default: false
    add_column :questions, :tieneMejorRespuesta, :boolean, default: false
  end
end
