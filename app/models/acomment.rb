class Acomment < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :answer
end
