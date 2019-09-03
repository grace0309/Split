class Review < ApplicationRecord
  belongs_to :user
  belongs_to :transaction

  validates :content, presence: true
end
