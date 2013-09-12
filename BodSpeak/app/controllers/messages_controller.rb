class MessagesController < ApplicationController
  before_filter :signed_in_user

  def create
  @message = current_user.messages.build(params[:message])
    if @message.save
      flash[:success] = "Message created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
end