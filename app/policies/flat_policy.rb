class FlatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def new?
  #   return true
  # end

  def create?
    true
  end

  def show?
    true
  end

  # need to be also the owner -> not just signin
  # def edit?
  #   # true
  #   user_is_owner?
  # end

  def update?
    # true
    user_is_owner?
  end

  def user_is_owner?
    # i do not use in pundit current_user BUT user
    record.user == user
  end
end
