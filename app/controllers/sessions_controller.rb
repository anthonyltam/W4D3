class SessionsController < ApplicationController
  
  def new
  
    render :new
  end
  
  #creates session
  def create
      
    # debugger
    # byebug
    @user = User.find_by_credentials(params[:user][:username],
    params[:user][:password])
    
    
    if @user
      # @user.reset_session_token
      p 'valid login info!'
      redirect_to cats_url
    else
      p 'invalid login info!'
      flash.now[:errors] = ['invalid login info']
      render :new
    end

  end
  
  # ends session, logout
  def destroy
    logout
    redirect_to new_session_url
  end
  
end