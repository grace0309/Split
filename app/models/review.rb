class Review < ApplicationRecord
  belongs_to :user
  belongs_to :review_transaction , :class_name => "Transaction", :foreign_key => :transaction_id
  validates :content, presence: true
end



