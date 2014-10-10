class Question < ActiveRecord::Base
  has_many :potential_answers
end
