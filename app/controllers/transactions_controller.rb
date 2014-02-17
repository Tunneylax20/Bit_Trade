class TransactionsController < ApplicationController

  before_action(:load_user, only: [:new, :create] )

  def new

  end

  def create
    @transaction = Transaction.new({:price => params[:price], :btc_total => params[:btc_total], :usd_total => params[:usd_total], :buy => params[:buy], :user_id => params[:user_id]})
    @transaction.save

    redirect_to user_path(@user)
  end

  def show
  end


  private

  def load_user
    return @user = User.find(params[:user_id])
  end

  def transaction_params
    params.require(:transaction).permit(:price, :btc_total, :usd_total, :buy, :user_id)
  end

end