class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
  end
  
  def create
    debugger
    @transaction = Transaction.new(transaction_params)
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
    params.require(:transaction).permit(:transaction_type, :amount)
  end
end
