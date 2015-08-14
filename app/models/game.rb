class Game < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :author_id, :description, :developer,
            :release_date, :rating, presence: true

  belongs_to(
    :author,
    class_name: :User,
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many :reviews, dependent: :destroy
  has_many :reviewers, through: :reviews, source: :author
  has_one :cover, as: :imageable, class_name: :Image

  def initialize(parameters)
    super(parameters)
    self.cover = Image.new({
      url: "http://res.cloudinary.com/jeffreycheng/image/upload/c_scale,h_400,w_350/v1439448506/Blank-Gray-Pic-03_skgolu.jpg",
      thumbnail_url: "http://res.cloudinary.com/jeffreycheng/image/upload/t_media_lib_thumb/v1439448506/Blank-Gray-Pic-03_skgolu.jpg",
      imageable_type: "Default",
      imageable_id: "1"
    })
  end

end
