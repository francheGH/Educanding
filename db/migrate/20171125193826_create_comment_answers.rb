class CreateCommentAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_answers do |t|
      t.string :text
      t.string :date

      t.timestamps
    end
  end
end
