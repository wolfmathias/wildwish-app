# frozen_string_literal: true

class Ability
  include CanCan::Ability
  

  def initialize(user)
    # users can see index of active or fulfilled wishes
    # cannot view new wishes yet (change this later maybe)
    can :read, Wish, { status: "fulfilled", status: "active" }
    can :read, Animal
    can :create, Donation
    
    if user.present? # if user logged in
      
      #can view own donations
      if user.donor?
        can :read, Donation, donor_id: user.donor.id
      end
      
      # for zookeeper accounts
      # full CRUD of animals
      # full CRUD of wish only if status is new
      # can only update attributes if status is delivered (to upload photo of delivered item)
      # can view all wishes
      if user.keeper?
        can :manage, Animal, keeper_id: user.keeper.id
        can :read, Wish, { keeper_id: user.keeper.id }
        can :update, Wish, { keeper_id: user.keeper.id, status: "delivered" }
        can :manage, Wish, { keeper_id: user.keeper.id, status: "new" } # make conditionals for keepers editing certain wishes
      end
    end
    
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    
  end
end
