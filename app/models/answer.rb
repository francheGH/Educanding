class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many :avotes, dependent: :destroy
  has_many :acomments, dependent: :destroy
  validates :respuesta,presence:true,uniqueness:true
end
