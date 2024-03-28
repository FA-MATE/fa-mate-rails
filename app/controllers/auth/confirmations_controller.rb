# frozen_string_literal: true

module Auth
  class ConfirmationsController < DeviseTokenAuth::ConfirmationsController
    def show
      @resource = resource_class.confirm_by_token(resource_params[:confirmation_token])

      if @resource.errors.empty?
        yield @resource if block_given?

        token = if signed_in?(resource_name)
                  new_token = signed_in_resource.create_token
                  signed_in_resource.save!
                  new_token
                else
                  @resource.create_new_auth_token
                end

        render json: {
          data: @resource.as_json.merge({
                                          access_token: token['access-token'],
                                          client: token['client'],
                                          uid: token['uid']
                                        })
        }, status: :ok
      else
        render json: {
          error: 'Invalid email or confirmation_token'
        }, status: :unauthorized
      end
    end
  end
end
