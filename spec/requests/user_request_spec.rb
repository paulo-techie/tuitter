require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST #create' do
    context 'when username is invalid' do
      it 'renders the page with error' do
        user = create(:username)

        post :create, session: { username: username }
        expect(flash[:errors]).to match(/^prohibited/)
      end
    end
  end
end
