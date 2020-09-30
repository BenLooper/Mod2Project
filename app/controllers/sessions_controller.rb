class SessionsController < ApplicationController

  def sign_in
    @user = User.new 
  end

  def create 

    @user = User.find_by username:user_params[:username]
    # byebug
    if @user && @user.authenticate(user_params[:password]) 
      session[:id] = @user.id
      redirect_to posts_path

    else 
      flash[:error] = "Incorrect username or password"
      redirect_to sign_in_path

    end 
  end 

  def user_params 
    params.require(:user).permit(:username, :password)
  end 
    
end
# Cassatt
# 3766787944