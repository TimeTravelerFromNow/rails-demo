class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: {minimum: 10}

  has_many :elements, dependent: :destroy
  has_one_attached :header_image
end
