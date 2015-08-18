class Like < ActiveRecord::Base
  validates :user, :review, :value, presence: true
end
