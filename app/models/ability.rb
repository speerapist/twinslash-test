# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    if user.present?
        can [:create, :user_posts], Post, user_id: user.id
        can :destroy, Post, user_id: user.id
        can :update, Post, user_id: user.id
    end
  end
end
