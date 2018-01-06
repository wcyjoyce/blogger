class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def dashboard?
    return true
  end

  def newsfeed?
    return true
    # record.user == user
  end
end
