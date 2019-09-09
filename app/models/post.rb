class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :transactions, dependent: :destroy
  has_many :users, through: :transactions
  has_many :messages, dependent: :destroy
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :store_name, :discount ],
    associated_against: {
      category: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }

  validates :store_name, presence: true
  validates :discount, presence: true
  validates :quota, presence: true
  validates :starting_contribution, presence: true
  validates :category, presence: true
  validates :units, presence: true

  mount_uploader :photo, PhotoUploader
  after_create :set_first_messagae
  before_save :check_time

  def set_first_messagae
    Message.create(message_content: 'Welcome friends!', post: self)
  end

  def post_valid?
    self.status == true
  end

  def post_complete
    if self.total_contribution >= self.quota
      self.status = false
      self.save
    end
  end

  def check_time
    if self.end_time <= Time.now
      self.status = false
    end
  end

  def check_if_expired
    if self.end_time <= Time.now
      self.status = false
    end
    self.save
  end
end
