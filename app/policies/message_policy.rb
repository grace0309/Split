class MessagePolicy < ApplicationPolicy
  def index?
    record.post.user == user ||  record.post.users.include?(user)
  end


end
