class TransactionsController < ApplicationController

  before_action(:load_user, only: [:new, :create] )
  before_action(:buy_and_sell_logic, only: [:new, :create])

  def new

  end

  def create
    # btc_total = params[:btc_total].to_i - 1
    # @transaction = Transaction.new({:price => params[:price], :btc_total => btc_total, :usd_total => params[:usd_total], :buy => params[:buy], :user_id => params[:user_id]})
    # @transaction.save
    @transaction = Transaction.new(:price => @price, :btc_total => @btc_total, :usd_total => @usd_total, :buy => @buy, :user_id => @user_id)
    @transaction.save

    redirect_to user_transaction_path(@user, @transaction)
  end

  def show
  end


  private

  def load_user
    return @user = User.find(params[:user_id])
  end

  def buy_and_sell_logic #(price, btc_total, usd_total, buy, user_id)
    @price = params[:price].to_i
    @buy = params[:buy].to_i
    @user_id = params[:user_id]

      if @buy == 0
        @usd_total = params[:usd_total].to_i * (-1)
        @btc_total = params[:btc_total].to_i
      else 
        @usd_total = params[:usd_total].to_i
        @btc_total = params[:btc_total].to_i * (-1)
      end

  end
end