class AddVotesToAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :positive_votes, :integer, :default => 0
    add_column :answers, :negative_votes, :integer, :default => 0
  end
end
