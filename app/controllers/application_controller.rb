class ApplicationController < ActionController::API
  before_action :authenticate

  def authenticate
    api_key = request.headers['Authorization']
    tenant = Tenant.select(:id).find_by(api_key: api_key)

    if tenant.blank?
      unauthorized!
    else
      tenant.register_usage
    end
  end

  def unauthorized!
    render json: { message: 'Invalid authorization header' }, status: :unauthorized
  end


end
