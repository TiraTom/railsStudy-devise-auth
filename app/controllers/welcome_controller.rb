class WelcomeController < ApplicationController

  def index
    redirect_to dashboard_path if authenticate_user!
  end
end
