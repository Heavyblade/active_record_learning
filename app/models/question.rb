class Question < ApplicationRecord
  #has_many :answers
  #has_many :comments, as: :commentable

  has_many :comments
  has_many :answers, through: :comments, source: :commentable, source_type: 'Answer'
end