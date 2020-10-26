class Post < ApplicationRecord
validates :image, :title, :detail, presence: true
validates :title, length: { maximum: 25 }
validates :detail, length: { maximum: 300}

belongs_to :user
has_many  :comment, dependent: :destroy
has_one_attached :image
end
