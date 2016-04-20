class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def resolve
    return scope.none if user.nil?
    return scope.all if user.admin?
    scope.joins(:roles).where(roles: {user_id: user})
  end

  def show?
    record.roles.exists?(user_id: user)
  end

  def update?
    user.try(:admin?) || record.roles.exists?(user_id: user,
                                              role: 'manager')
  end
end
