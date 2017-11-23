class ChangeFacultyFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :facultad, :string
    add_column :users, :faculty_id, :integer
  end
end
