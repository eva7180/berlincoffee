class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #guest user (not logged in)
    can :read, Product # permissions for every user, even if not logged in
    if user.present?  # additional permissions for logged in users
      can [:create, :destroy], Comment, user_id: user.id
      can [:show, :create, :update, :destroy], User, id: user.id #can manage own user, but can NOT index all users
      can :manage, Order, user_id: user.id
      if user.admin?  # additional permissions for administrators
        can :manage, :all
      end
    end
  end
  
end
