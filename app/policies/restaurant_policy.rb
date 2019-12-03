class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # if user.admin?
        scope.all #scope is the Restaurant class
      # else
      #   scope.where(user: user)
      # end
      # Restaurant.all
    end
  end

  # def new? #restaurant instance
  #   create?
  # end

  def create? #restaurant instance
    true
  end

  def show? #restaurant instance
    true
  end

  def index? #Restaurant class
    true
  end

  def update? #restaurant instance
    # i can perform the update only if i am the creator of the restaurant
   # record.user == user || user.admin
   # @restaurant.user == current_user
    check_if_user_is_owner_or_admin?
  end

  # def edit? #restaurant instance
  #   update?
  # end

  def destroy? #restaurant instance
     # record.user == user || user.admin
     check_if_user_is_owner_or_admin?
  end

  private

  def check_if_user_is_owner_or_admin?
     record.user == user || user.admin
  end
end
