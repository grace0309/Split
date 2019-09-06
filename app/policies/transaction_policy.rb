class TransactionPolicy < ApplicationPolicy
  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end
  def show?
    return true
  end

  def new?
    if record.post.post_valid?
      return true
    else
      return false
    end
  end

  def create?
    if record.post.post_valid?
      return true
    else
      return false
    end
  end


  def edit?
    if record.user == user && record.post.post_valid?
      return true
    else
      return false
    end
  end

  def update?
    if record.user == user && record.post.post_valid?
      return true
    else
      return false
    end
  end

  def destroy?
    record.user == user
  end
end
