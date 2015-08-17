class Tag < ActiveRecord::Base
  validates :label, presence: true, uniqueness: true

  has_many :taggings
  has_many :games, through: :taggings, source: :game

  def self.findOrCreateByLabel(lbl)
    tag = Tag.find_by_label(lbl)

    return tag ? tag : Tag.create(label: lbl)
  end
end
