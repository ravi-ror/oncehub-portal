class ExpensesController < ApplicationController
  def index
    @expenses = current_user.expenses
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user = current_user
    if @expense.save
      redirect_to "/expenses"
    else
      render 'new'
    end
  end
  
  private

  def expense_params
    params.require(:expense).permit(:year, :month, :amount, :description)
  end
end
