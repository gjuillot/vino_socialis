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
    can [:create, :read, :search, :taste, :encave], [Estate, Wine]
    if user.moderator?
      can :manage, [Estate, Wine]
    end
    
    # Tasting
    can [:create, :read], Tasting
    can :manage, Tasting, :user => user
    
    # Bottle
    can [:create], Bottle
    can :manage, Bottle, :user => user
  end
end
