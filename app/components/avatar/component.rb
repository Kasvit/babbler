# frozen_string_literal: true

class Avatar::Component < ApplicationComponent
  attr_reader :user

  def initialize(user:)
    @user = user
  end

  def initials
    user.username.first.capitalize
  end
end
