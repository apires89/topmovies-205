class MoviePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    record.user == user || user_is_admin?
  end

  def edit?
    record.user == user || user_is_admin?
  end

  def show?
    true
  end

  def destroy?
    record.user == user || user_is_admin?
  end

  def top?
    true
  end

  private

  def user_is_admin?
    user.admin == true
  end

end
