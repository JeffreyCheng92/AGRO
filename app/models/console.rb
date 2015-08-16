# == Schema Information
#
# Table name: consoles
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Console < ActiveRecord::Base
  validates :name, presence: true

  has_many :game_consoles, dependent: :destroy, inverse_of: :console
  has_many :games, through: :game_consoles, source: :game
  attr_accessor :searched_games, :searched

  def initialize
    super
    @searched_games ||= []
    @searched = false
  end

end
