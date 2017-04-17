class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to questions_path
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @questions = @user.questions
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end


end
