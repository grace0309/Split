class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_contribution, presence: true
end
