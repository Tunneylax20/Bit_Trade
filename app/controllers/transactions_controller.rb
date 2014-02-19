class TransactionsController < ApplicationController

  before_action(:load_user, only: [:new, :create, :show] )
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
    @transaction = @user.transactions
  end


  private

  def load_user
    return @user = User.find(params[:user_id])
  end

  def buy_and_sell_logic
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

    if -@usd_total > @user.current_usd_balance
      flash[:error] = "Not enough USD in balance to complete this transaction!"
      redirect_to user_path(@user)
    end

    if -@btc_total > @user.current_btc_balance
      flash[:error] = "Can't sell Bitcoins you don't have!"
      redirect_to user_path(@user)
    end

    if @usd_total <= 0
      flash[:error] = "Invalid Entry"
      redirect_to user_path(@user)
    end

  end
end