class Faculty < ApplicationRecord
  has_many :questions

  def facultad_y_universidad
    "#{facultad} | #{universidad}"
  end
end
