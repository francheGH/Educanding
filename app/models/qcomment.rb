class Qcomment < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :qcvotes, dependent: :destroy
  validates :texto,presence:true,uniqueness:true
end
