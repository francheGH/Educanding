class AddVotesToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :positive_votes, :integer, :default => 0
    add_column :questions, :negative_votes, :integer, :default => 0
  end
end
