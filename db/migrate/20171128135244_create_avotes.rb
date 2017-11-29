class CreateAvotes < ActiveRecord::Migration[5.1]
  def change
    create_table :avotes do |t|
      t.references :user, foreign_key: true
      t.references :answer, foreign_key: true
      t.boolean :positivo
      
      t.timestamps
    end
  end
end
