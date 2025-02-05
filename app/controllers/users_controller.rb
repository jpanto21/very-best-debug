class UsersController < ApplicationController

  def home
  

    redirect_to("/users")
  end
  
  def index
    matching_users = User.all
    @users = matching_users.order(:created_at)

    render({ :template => "user_templates/all_users"})
  end
  
  def show
    username = params.fetch("username")
    matching_users = User.where({ :username => username })
    @user = matching_users.at(0)

    render({ :template => "user_templates/user_details"})
  end
  
  def create
    user = User.new
    user.username = params.fetch("query_username")
    user.save
    
    redirect_to("/users/"+user.username)
  end
  
  def update
    user_url = params.fetch("user_id")
    matching_users = User.where({ :username => user_url})
    the_user = matching_users.at(0)
    
    input_username = params.fetch("query_username")
    the_user.username = input_username
    the_user.save

    redirect_to("/users/"+ the_user.username)
  end

end
