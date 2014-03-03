module BuyHelper

  def buy_sell_logic
      @price = params[:price].to_f
      @buy = params[:buy].to_f
      @user_id = params[:user_id].to_f
      @btc_total = params[:btc_total].to_f
      @usd_total = params[:usd_total].to_f
      @doge_total = params[:doge_total].to_f


      if (@buy == 0) && (@btc_total != 0)
        @usd_total = @usd_total * (-1)
      else 
        @btc_total = @btc_total * (-1)
      end

      if (@buy == 0) && (@doge_total != 0)
        @usd_total = params[:usd_total].to_i * (-1)
      else 
        @doge_total = params[:doge_total].to_i * (-1)
      end

      ### check USD balance to clear transaction ###
      if -@usd_total > @user.current_usd_balance
        flash[:error] = "You don't have enough USD to complete this transaction!"
        redirect_to user_path(@user)
      end

      ### check Bitcoin balance to clear transaction ###
      if -@btc_total > @user.current_btc_balance
        flash[:error] = "Can't sell Bitcoins you don't have!"
        redirect_to user_path(@user)
      end

      if -@doge_total > @user.current_doge_balance
        flash[:error] = "Can't sell Bitcoins you don't have!"
        redirect_to user_path(@user)
      end

      ### protecting against unknown characters ###
      if -@usd_total <= 0 && @btc_total > 0
        flash[:error] = "Invalid Entry, but nice try"
        redirect_to user_path(@user)
      end

      if @usd_total <= 0 && @btc_total < 0
        flash[:error] = "Invalid Entry, but nice try"
        redirect_to user_path(@user)
      end

      if -@usd_total <= 0 && @doge_total > 0
        flash[:error] = "Invalid Entry, but nice try"
        redirect_to user_path(@user)
      end

      if @usd_total <= 0 && @doge_total < 0
        flash[:error] = "Invalid Entry, but nice try"
        redirect_to user_path(@user)
      end

    end

end