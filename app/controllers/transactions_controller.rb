class TransactionsController < ApplicationController

  before_action(:load_user, only: [:new, :create, :show] )
  before_action(:buy_sell_logic, only: [:new, :create])
  include BuyHelper

  def new
  end

  def create
    @transaction = Transaction.new(:price => @price, :btc_total => @btc_total, :doge_total => @doge_total, :usd_total => @usd_total, :buy => @buy, :user_id => @user_id)
    @transaction.save

    redirect_to user_path(@user)
  end

  def show
    @transaction = @user.transactions
  end


  private

  def load_user
    return @user = User.find(params[:user_id])
  end

  
end