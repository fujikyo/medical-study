class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :email, :password, :specialize, :experience, :word, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i }
  validates :word, length: { maximum: 20 }


  has_many :comment
  has_many :post, dependent: :destroy
  has_many :post, through: :favorite
end
