class Tagging < ActiveRecord::Base
  validates :tag, :game, presence: true

  belongs_to :game
  belongs_to :tag

end
