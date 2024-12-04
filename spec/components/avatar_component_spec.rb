# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Avatar::Component, type: :component do
  let(:user) { build(:user, username: 'john_doe') }

  describe '#initials' do
    it 'returns the capitalized first letter of the username' do
      component = described_class.new(user: user)
      expect(component.initials).to eq('J')
    end
  end
end
