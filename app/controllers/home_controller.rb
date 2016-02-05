class HomeController < ApplicationController

  def index
    if current_user
      redirect_to girls_path 
    else
      @users_count = User.count
      @messages_count = Message.count
    end
  end

  def static_page
  end
  
  def dashboard
  end  

end
