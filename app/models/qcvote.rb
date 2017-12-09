class Qcvote < ApplicationRecord
  belongs_to :user
  belongs_to :qcomment
end
