class User < ApplicationRecord
  has_many :posts
  has_many :transactions

  has_many :reviews
  has_many :messages
  has_many :favourites
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def joined_posts
    post_ids = self.transactions.pluck(:post_id)
    Post.where(id: post_ids)
  end

  def has_notification?
    self.posts.where(notify: true).any?
  end
end
