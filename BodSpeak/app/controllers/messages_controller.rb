class MessagesController < ApplicationController
#the message contrller takes care of all the messaging functionality in BodSpeak
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
  
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end
  
  def edit
  @message = Message.find(params[:id])
  end
  
  
  def update
  @message = Message.find(params[:id])

  if @message.update_attributes params[:message]
    flash[:notice] = 'The User is successfully updated!'
  end
end
end
