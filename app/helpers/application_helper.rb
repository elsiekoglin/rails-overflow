module ApplicationHelper

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current = User.find_by(id: session[:user_id]) if logged_in?
  end

  def set_user(user)
    session[:user_id] = user.id
  end

  def author?(user_id)
    session[:user_id] == user_id
  end

  def current_question
    @question = Question.find_by(id: params[:question_id])
  end


end
