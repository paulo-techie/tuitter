class User < ApplicationRecord
  validates :fullname, presence: true,
            length: { maximum: 50 }
  validates :username, uniqueness: true, presence: true,
            length: { maximum: 20 },
            format: { with: /\A[a-zA-Z]+\z/,
            message: "only allows letters" }
  has_attached_file :photo, :styles => { profilepic: "125x125#", thumb: "48x48#" }, default_url: "tuitter-egg.jpg"
            # Validate content type
  validates_attachment_content_type :photo, content_type: /\Aimage/

  has_many  :tueets, dependent: :destroy
  before_save :format_username

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  def format_username
    self.username = self.username.delete(' ').downcase
  end

  def self.find_user_by(value)
    where([":id = value", {value: value}]).first
  end

  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end
end
