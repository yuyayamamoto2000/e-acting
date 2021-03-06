class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?#deviseコントローラーにストロングパラメータを追加する

  before_action :authenticate_user!#ログイン済みユーザーのみアクセスを許可する

  def after_sign_in_path_for(resource)
    user_path(id: current_user.id)
  end
  protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
    #サインアップ時に画像のストロングパラメーターを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
  end
end
