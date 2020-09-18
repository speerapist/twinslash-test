# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    if user.present?
        can [:create, :user_posts], Post, user_id: user.id
        can :destroy, Post, user_id: user.id
        can :update, Post, user_id: user.id, status: 0
        can :status_new, Post, user_id: user.id, status: 0
        can :status_draft, Post, user_id: user.id, status: [5, 2]
    end
  end
end
