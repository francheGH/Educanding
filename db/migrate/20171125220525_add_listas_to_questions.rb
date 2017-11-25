class AddListasToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :visitas, :integer, default: 0
    add_column :questions, :cant_respuestas, :integer, default: 0
  end
end
