class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
    @income_sum = Transaction.incomes
    @expenses_sum = Transaction.expenses
  end
    
  def new
    @transaction = Transaction.new
    @categories = Category.all.map {|c| [c.title, c.id]}
  end
  
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user if current_user.present?
    if @transaction.save
      flash[:notice] = "Transaction was saved succefully"
      redirect_to root_path
    else
      render 'new'
    end
    puts 1
  end
  
  private
  
  def transaction_params
    params.require(:transaction).permit(:transaction_type, :amount, :title, :category_id, :date)
  end
end
