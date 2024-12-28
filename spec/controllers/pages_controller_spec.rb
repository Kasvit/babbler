require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #about' do
    it 'повертає успішну відповідь' do
      get :about
      expect(response).to be_successful
    end

    it 'рендерить шаблон about' do
      get :about
      expect(response).to render_template(:about)
    end
  end
end 