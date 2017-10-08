class WelcomeController < ApplicationController

  def index
    if authenticate_user!
      redirect_to("/dashboard")
    end
  end
end
