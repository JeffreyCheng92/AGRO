# == Schema Information
#
# Table name: game_consoles
#
#  id         :integer          not null, primary key
#  game_id    :integer          not null
#  console_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GameConsole < ActiveRecord::Base
  validates :game, :console, presence: true
  validates :game_id, uniqueness: { scope: :console_id }

  belongs_to :game, inverse_of: :game_consoles
  belongs_to :console, inverse_of: :game_consoles
end
