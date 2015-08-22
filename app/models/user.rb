# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  email           :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  bio             :text
#  location        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :password_digest, :session_token, presence: true
  validates :email, :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true}

  attr_reader :password
  after_initialize :ensure_session_token
  after_save :ensure_has_avatar

  has_many(
    :games,
    class_name: :Game,
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :reviews,
    class_name: :Review,
    foreign_key: :author_id,
    dependent: :destroy
    )

  has_many :likes
  has_many :liked_reviews, through: :likes, source: :reviews

  has_many :reviewed_games, through: :reviews, source: :game

  has_one :avatar, as: :imageable, class_name: :Image

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return (user && user.is_password?(password)) ? user : nil
  end

  def karma
    Like.where("user_id = ?", self.id).count
  end

  def recent_reviews
    Game.find_by_sql(
    ["
      SELECT
        games.id, games.title
      FROM
        games
      JOIN
        reviews ON reviews.game_id = games.id
      JOIN
        users ON reviews.author_id = users.id
      WHERE
        users.id = ?
      ORDER BY
        reviews.created_at DESC
      LIMIT
        5",
      self.id])
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

  def generate_session_token
    SecureRandom.urlsafe_base64
  end

  def reset_session_token
    self.session_token = generate_session_token
    self.save!
    return self.session_token
  end

  def ensure_has_avatar
    self.avatar ||= Image.create!({
      url: "http://res.cloudinary.com/jeffreycheng/image/upload/c_scale,h_400,w_350/v1439448506/Blank-Gray-Pic-03_skgolu.jpg",
      thumbnail_url: "http://res.cloudinary.com/jeffreycheng/image/upload/t_media_lib_thumb/v1439448506/Blank-Gray-Pic-03_skgolu.jpg",
      imageable_type: "User",
      imageable_id: self.id
    })
  end
end
