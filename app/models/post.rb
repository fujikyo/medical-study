class Post < ApplicationRecord
validates :title, :detail, presence: true
validates :title, length: { maximum: 25 }
validates :detail, length: { maximum: 300}

belongs_to :user
has_many  :comment, dependent: :destroy
has_many :user, through: :favorite
has_one_attached :image

  def self.search(search)
    if search != ""
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end

