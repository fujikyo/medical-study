class Post < ApplicationRecord
  belongs_to :user
  has__many  :comment
end
