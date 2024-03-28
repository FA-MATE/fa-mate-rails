# frozen_string_literal: true

module Auth
  class SessionsController < DeviseTokenAuth::SessionsController
    def create
      user = resource_class.find_by(email: params[:email])
      if user&.valid_password?(params[:password])

        token = user.create_new_auth_token

        render json: {
          data: user.as_json.merge({
                                     access_token: token['access-token'],
                                     client: token['client'],
                                     uid: token['uid']
                                   })
        }, status: :ok
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  end
end
