class Transaction < ActiveRecord::Base
  belongs_to :category
  INCOME = "income"
  EXPENSE = "expense"
  
  scope :incomes, -> { where(transaction_type: INCOME).sum(:amount) }
  scope :expenses, -> { where(transaction_type: EXPENSE).sum(:amount) }
  def income?
    transaction_type == INCOME
  end
  
  def expense?
    transaction_type == EXPENSE
  end
end
