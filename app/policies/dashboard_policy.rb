class DashboardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def all_bookings?
    return true
  end

  def all_flats?
    return true
  end
end
