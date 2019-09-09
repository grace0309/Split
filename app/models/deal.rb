class Deal < ApplicationRecord
  has_many :favourites
  include PgSearch::Model
   pg_search_scope :deal_search,
    against: [ :title, :description],
    using: {
      tsearch: { prefix: true }
    }
end
