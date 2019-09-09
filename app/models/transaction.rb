class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :contribution, presence: true
end
