class CreateQcvotes < ActiveRecord::Migration[5.1]
  def change
    create_table :qcvotes do |t|
      t.references :user, foreign_key: true
      t.references :qcomment, foreign_key: true
      t.boolean :positivo

      t.timestamps
    end
  end
end
