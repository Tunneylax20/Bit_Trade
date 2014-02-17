class TransactionsController < ApplicationController

  before_action(:load_user, only: [:new, :create] )

  def new
  end

  def create
    @transaction = Transaction.new(:price, :btc_total, :usd_total, :buy, :user_id)
    @transaction.save

    redirect_to_user_path(@user)
  end


  private

  def load_user
    return @user = User.find(params[:user_id])
  end

  def transaction_params
    params.require(:transaction).permit(:price, :btc_total, :usd_total, :buy, :user_id)
  end

end