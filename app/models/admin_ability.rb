class AdminAbility
  include CanCan::Ability
  def initialize(user)
    if user&.admin?
      can :access, :rails_admin
      can :read, :all
      can %i[destroy update approve], Post
      can %i[create destroy update], User
      can %i[create destroy], PostType
    end
  end
end
