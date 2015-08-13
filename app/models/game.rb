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

  has_one :cover, as: :imageable, class_name: :Image

end
