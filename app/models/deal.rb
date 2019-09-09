class Deal < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [ :title, :description ]
end
