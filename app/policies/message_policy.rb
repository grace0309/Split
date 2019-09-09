class MessagePolicy < ApplicationPolicy
  def index?
    record.post.user == user || record.post.users.include?(user)
  end

  def new
    record.post.user == user || record.post.users.include?(user)
  end

  def create
    record.post.user == user || record.post.users.include?(user)
  end

end
