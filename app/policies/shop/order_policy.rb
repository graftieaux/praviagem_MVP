class Shop::OrderPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        # scope.where(published: true)
        user.orders
      end
    end

    private

    attr_reader :user, :scope
  end

  def index?
    user.role == "Shop"
  end
end
