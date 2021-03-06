class SessionsController < ApplicationController
def new
  end

  def create
  
  user = User.find_by_email(params[:session][:email].downcase)
  if user && user.authenticate(params[:session][:password]) && user.user_type=='P'
    sign_in(user)
      redirect_to user
	  elsif user && user.authenticate(params[:session][:password]) && user.user_type=='D'
	  sign_in(user)
	  redirect_to doctor_show_path
	  else
    flash.now[:error] = 'Invalid email/password combination'
      render 'new'
  end
  end

  def destroy
  sign_out
    redirect_to root_url
  end

end
