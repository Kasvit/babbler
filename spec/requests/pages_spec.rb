require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe 'GET #about' do
    it 'returns successful response' do
      get about_path
      expect(response).to be_successful
    end

    it 'renders about template' do
      get about_path
      expect(response).to render_template(:about)
    end
  end
end
