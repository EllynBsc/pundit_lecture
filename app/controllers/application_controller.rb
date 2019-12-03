class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  include Pundit

   # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end
  private

  def skip_pundit?
    # if your controller is devise controller, skip pundit
    # becayse you don't want to prevent the user from login or signing up.
    # if the controller is admin, by definition an admin is able to perform everyhting
    # if the controller is pages, it's static everybody should see it
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
