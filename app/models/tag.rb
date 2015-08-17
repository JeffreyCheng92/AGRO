class Tag < ActiveRecord::Base
  validates :label

  def Tag.findOrCreateByLabel(label)
    tag = Tag.find_by_label(label)

    if tag
      return tag
    else
      Tag.create(label: label)
    end
    
  end
end
