class User < ApplicationRecord
  validates :fullname, presence: true,
            length: { maximum: 50 }
  validates :username, uniqueness: true, presence: true,
            length: { maximum: 20 },
            format: { with: /\A[a-zA-Z]+\z/,
            message: "only allows letters" }
  has_many  :tueets
  before_save :format_username

  
def format_username
  self.username = self.username.delete(' ').downcase
end

def self.find_user_by(value)
  where([":username = value", {value: value}]).first
end
end
