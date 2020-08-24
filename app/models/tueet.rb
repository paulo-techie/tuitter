class Tueet < ApplicationRecord
  validates   :tueet, presence: true, 
              length: { maximum: 145 }
  belongs_to  :user
end
