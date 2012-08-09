class Ability
  include CanCan::Ability
  
  # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities

  def initialize(user)
    if (user.nil?)
      return
    end
    
    if user.admin?
      can :manage, :all
    end
    
    # User
    can :read, User
    can :update, User, :id => user.id
    
    # Country, Region, Area
    can :read, [Country, Region, Area]
    
    # Estate, Wine
    can [:create, :read], [Estate, Wine]
    if user.moderator?
      can :manage, [Estate, Wine]
    end
  end
end
