# frozen_string_literal: true

# OmniauthCallbacks Controller
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def stripe_connect
    auth_data = request.env['omniauth.auth']
    @user = current_user
    if @user.persisted?
      @user.provider = auth_data.provider
      @user.uid = auth_data.uid
      @user.access_code = auth_data.credentials.token
      @user.publishable_key = auth_data.info.stripe_publishable_key

      sign_in_and_redirect @user, event: :authentication

      flash[:notice] = 'Stripe account created and connected' if is_navigational_format?
    else
      session['devise.stripe_connect_data'] = request.env['omniauth.auth']
      redirect_to root_path
    end
  end

  def failure
    redirect_to root_path
  end
end
