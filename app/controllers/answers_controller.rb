class AnswersController < ApplicationController
  def create
    @question = Question.find(answer_params[:question_id])
    puts "=============#{@question}"
    @answer = @question.answers.new(text: answer_params[:text])
    @answer.user = current_user
    @answer.save
    redirect_to @question
  end

  private

  def answer_params
    params.require(:answer).permit(:text, :question_id)
  end  
end
