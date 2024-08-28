class ProjectPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.manager? || user.developer? || user.q_a?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def create?
    user.manager?
  end

  def update?
    user.manager?
  end

  def destroy?
    user.manager?
  end

  def edit?
    user.manager?
  end

  def show?
    user.manager? || user.developer? || user.q_a? || record.user == user
  end
end
