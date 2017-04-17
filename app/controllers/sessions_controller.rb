class SessionsController < ApplicationController
  def new
   # render :new
  end

  def create
    @user = User.authenticate(params[:username], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to question_path
    else
      @errors = ["That user does not exist."]
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sessions_path
  end
end
