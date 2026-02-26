require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new user' do
        expect {
          post :create, params: { user: { name: 'John Doe', email: 'john@example.com', password: 'password123' } }
        }.to change(User, :count).by(1)
      end

      it 'renders a 201 status code' do
        post :create, params: { user: { name: 'John Doe', email: 'john@example.com', password: 'password123' } }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'renders a 422 status code' do
        post :create, params: { user: { name: 'John Doe', email: 'john@example.com' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end