# frozen_string_literal: true

module Avatar
  class Component < ApplicationComponent
    attr_reader :user

    def initialize(user:)
      @user = user
    end

    def initials
      user.username.first.capitalize
    end
  end
end
