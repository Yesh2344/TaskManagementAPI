# Minor edit
class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate_request

  private

  def authenticate_request
    @current_user ||= authenticate_token
    render json: { error: 'Invalid credentials' }, status: :unauthorized unless @current_user
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      User.find_by(token: token)
    end
  end
end