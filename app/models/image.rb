# == Schema Information
#
# Table name: images
#
#  id             :integer          not null, primary key
#  url            :string           not null
#  thumbnail_url  :string           not null
#  imageable_id   :integer          not null
#  imageable_type :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Image < ActiveRecord::Base
  validates :url, :thumbnail_url, :imageable_id, :imageable_type, presence: true

  belongs_to :imageable, polymorphic: true
end
