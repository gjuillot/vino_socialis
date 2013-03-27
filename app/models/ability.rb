class Ability
  include CanCan::Ability
  
  # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities

  def initialize(user)
    
    # Country, Region, Area
    can :read, [Country, Region, Area]
    can :for_region_id, Area
    
    can :read, [GrapeVariety, Glossary, Vintage]
    
    can :read, [Estate, Wine]
    
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
    can [:update, :dashboard, :stat], User, :id => user.id
    
    # Glossary
    if user.moderator?
      can :manage, Glossary
    end
    
    # Estate, Wine, GrapeVariety
    can [:create, :read, :search, :taste, :encave, :recommand, :unrecommand], [Estate, Wine, GrapeVariety]
    can [:add_label], Wine
    if user.moderator?
      can :manage, [Estate, Wine, GrapeVariety]
    end
    
    # Wine Recommandation
    can [:read, :most], WineRecommandation
    
    # Tasting
    can [:create, :read], Tasting
    can :manage, Tasting, :user => user
    
    # Bottles and Racks and Consumptions
    can [:create], [Bottle, WineRack, Consumption]
    can :manage, [Bottle, WineRack, Consumption], :user => user
    
    # Labels
    can [:create, :read], Label
    
    can [:rate], Vintage
  end
end
