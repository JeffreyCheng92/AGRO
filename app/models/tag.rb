class Tag < ActiveRecord::Base
  validates :label, presence: true

  has_many :taggings
  has_many :games, through: :taggings, source: :game

  def Tag.findOrCreateByLabel(lbl)
    tag = Tag.find_by_label(lbl)

    if tag
      return tag
    else
      Tag.create(label: lbl)
    end

  end
end
