class Comment < ApplicationRecord
  validates :text, presence: true
  validates :text, length: { maximum: 50}
  
  belongs_to :user
  belongs_to :post
end
