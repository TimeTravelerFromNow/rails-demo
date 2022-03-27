class Element < ApplicationRecord
  belongs_to :article

  has_rich_text :content
end
