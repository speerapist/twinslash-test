# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

     user.present?
      can %i[create user_posts user_archive], Post, user_id: user.id
      can :destroy, Post, user_id: user.id
      can :update, Post, user_id: user.id, status: 'draft'
      can :status_new, Post, user_id: user.id, status: 'draft'
      can :status_draft, Post, user_id: user.id, status: %w[rejected new_post archived]
    end
  end
end