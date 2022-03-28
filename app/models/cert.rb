class Cert < ApplicationRecord
  has_rich_text :description
  validates :title, presence: true
  validates :description, presence: true, length: {minimum: 8}

  has_one_attached :header_image
end
