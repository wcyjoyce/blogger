class RelationshipPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    # return true
    record.user == user
  end

  def destroy?
    # return true
    record.user == user
  end
end
