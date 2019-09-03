class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :transactions, dependent: :destroy

  validates :store_name, presence: true
  validates :discount, presence: true
  validates :quota, presence: true
  validates :starting_contribution, presence: true
  validates :category, presence: true
  validates :units, presence: true

  mount_uploader :photo, PhotoUploader


  def post_valid?
    self.status == true
  end

  def post_complete?
    if self.total_contribution >= self.quota
      self.status = false
      self.save
    end
  end

  def check_time
    if self.end_time <= Time.now
      self.status = false
      self.save
    end
  end
end
