class SessionsController < ApplicationController

  def new
    @price = get_current_price
    render(:new)
  end

  def create
    # find if any user has that email
    user = User.find_by(email: params[:email])
    
    # if that user exists and it has a password that
    # was sent
    if user && ( user.authenticate(params[:password]) )
      
      # save the user_id in the session hash
      session[:user_id] = user.id

      # and redirect to that user's home page
      redirect_to( user_path(user) )
    else

      # the email/password is wrong!
      @message = "This email and password combination does not exist."
      render(:new)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def get_current_price
    from_bitstamp = HTTParty.get("https://www.bitstamp.net/api/ticker/")
    return from_bitstamp["last"]
  end

end