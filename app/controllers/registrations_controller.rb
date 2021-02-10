class RegistrationsController < Devise::RegistrationsController
  #The methods below modifies the predefined methods sign_up_params and account_update_params to include custom fields in devise authentication.
  private
  def sign_up_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :current_password)
  end
end
