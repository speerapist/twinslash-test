class AdminAbility
	include CanCan::Ability
	def initialize(user)
		if user && user.admin?
			can :access, :rails_admin
			can :read, :all
			can [:destroy, :update, :approve], Post
            can [:create, :destroy, :update], User
            can [:create, :destroy], PostType
        end
    end
end
