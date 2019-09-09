class Deal < ApplicationRecord
  has_many :favourites
  include PgSearch::Model
  multisearchable against: [ :title, :description ]
end
