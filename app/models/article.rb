class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: {minimum: 2}

  has_many :elems
  has_many :elements
  has_one_attached :header_image
end
