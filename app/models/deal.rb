class Deal < ApplicationRecord
  has_many :favourites, dependent: :destroy
  include PgSearch::Model
   pg_search_scope :deal_search,
    against: [ :title, :description],
    using: {
      tsearch: { prefix: true }
    }
end
