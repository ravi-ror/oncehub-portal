class QuestionsController < ApplicationController
    def index
        @questions = Question.all
    end

    def new
        @question = Question.new
    end

    def create
        @question = current_user.questions.build(question_params)
        if @question.save
          redirect_to '/questions'
        else
          render 'new'
        end
    end

    def show
        @question = Question.find(params[:id])
        @answers = @question.answers
    end    

    private
    def question_params
        params.require(:question).permit(:text)
    end    
end
