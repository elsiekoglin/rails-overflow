class SessionsController < ApplicationController
  def new
   # render :new
  end

  def create
    puts "HERE"
    p session_params
    @user = User.authenticate(session_params[:email], session_params[:password])

    if @user
      session[:user_id] = @user.id
      redirect_to questions_path
    else
      @errors = ["That user does not exist."]
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    # session[:user_id] = nil
    redirect_to questions_path
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end

end
