class User < ActiveRecord::Base
  validates :password_digest, :session_token, presence: true
  validates :email, :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true}

  attr_reader :password
  after_initialize :ensure_session_token

  has_many(
    :games,
    class_name: :Game,
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many :reviews, dependent: :destroy

  has_many :reviewed_games, through: :reviews, source: :game

  has_many :avatars, as: :imageable, class_name: :Image

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return (user && user.is_password?(password)) ? user : nil
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
end
