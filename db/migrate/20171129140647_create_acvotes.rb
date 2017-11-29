class CreateAcvotes < ActiveRecord::Migration[5.1]
  def change
    create_table :acvotes do |t|
      t.references :user, foreign_key: true
      t.references :acomment, foreign_key: true
      t.boolean :positivo

      t.timestamps
    end
  end
end
