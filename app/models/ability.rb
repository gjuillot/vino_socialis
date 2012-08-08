class Ability
  include CanCan::Ability
  
  # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.admin?
      can :manage, :all
    end
    
    # User
    can :read, User
    can :update, User, :id => user.id
    
    # Country, Region, Area
    can :read, [Country, Region, Area]
    
    # Estate
    can [:create, :read], Estate
    if user.moderator?
      can :manage, Estate
    end
  end
end
