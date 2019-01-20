class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #guest user (not logged in)
    can :manage, User, id: user.id # permissions for every user, even if not logged in
    if user.present?  # additional permissions for logged in users
      can :create, Comment
      can :manage, Order, user_id: user.id
      if user.admin?  # additional permissions for administrators
        can :destroy, Comment
        can :manage, User
      end
    end
  end
  
end
