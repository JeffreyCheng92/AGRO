class Tag < ActiveRecord::Base
  validates :label

  def Tag.findOrCreateByLabel(lbl)
    tag = Tag.find_by_label(lbl)

    if tag
      return tag
    else
      Tag.create(label: lbl)
    end

  end
end
