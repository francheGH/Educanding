class Acomment < ApplicationRecord
  
  belongs_to :user
  belongs_to :question
  belongs_to :answer
  has_many :acvotes, dependent: :destroy
  validates :texto,presence:true,uniqueness:true
end
