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
    
    if user.moderator?
      can :manage, Moderation
    end
    
    # User
    can :read, User
    can :update, User, :id => user.id
    
    # Country, Region, Area
    can :read, [Country, Region, Area]
    can :for_region_id, Area
    
    # Glossary
    can :read, Glossary
    if user.moderator?
      can :manage, Glossary
    end
    
    # Estate, Wine
    can [:create, :read, :search, :taste, :encave, :recommand, :unrecommand], [Estate, Wine]
    if user.moderator?
      can :manage, [Estate, Wine]
    end
    
    # Wine Recommandation
    can [:read, :most], WineRecommandation
    
    # Tasting
    can [:create, :read], Tasting
    can :manage, Tasting, :user => user
    
    # Bottles and Racks and Consumptions
    can [:create], [Bottle, WineRack, Consumption]
    can :manage, [Bottle, WineRack, Consumption], :user => user
  end
end
