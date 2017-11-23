class AddFacultyIdToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :faculty_id, :integer
  end
end
