class ItemPolicy < ApplicationPolicy
  def destroy?
    user.present? && (record.user == user)
  end

  def create?
  	user.present?
  end
end