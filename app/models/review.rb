class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, presence: true, length: {minimum: 20}
end
