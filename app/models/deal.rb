class Deal < ApplicationRecord
  include PgSearch::Model
   pg_search_scope :deal_search,
    against: [ :title, :description],
    using: {
      tsearch: { prefix: true }
    }
end
