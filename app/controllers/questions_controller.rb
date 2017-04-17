class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(params[:question])
    @question.user_id = session[:user_id]
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def show
    @question = Question.find_by(id: params[:id])
  end

  def edit
    @question = Question.find_by(id: params[:id])
  end

  def update
    @question = Question.find_by(id: params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

end
