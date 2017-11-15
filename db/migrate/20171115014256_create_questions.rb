class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :pregunta
      t.string :detalles

      t.timestamps
    end
  end
end
