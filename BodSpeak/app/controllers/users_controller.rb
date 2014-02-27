class UsersController < ApplicationController

#User controller to create and maintain users.
respond_to :html, :js
def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    end
  
  def create
    @user = User.new(params[:user])
	respond_to do |format|
      if @user.save	  
	  sign_in @user
	  format.html { redirect_to(@user, :notice => 'Post created.') }  
       format.js 
	#  flash[:success] = "Welcome to the Sample App!"
    #  redirect_to @user
    else
	format.html { render :action => "new" }  
        format.js 
      #render 'new'
    end
	end
  end
  
  def check_email
    @user = User.find_by_email(params[:user]['email'])
    result = Hash.new
    result["isavailable"] = (@user == nil) ? true : false
    result["email"] = params[:user]['email']
    render json: result
  end
  
  def show
@user = User.find(params[:id])
    @messages = @user.messages.paginate(page: params[:page])
  end
end

class Api::UsersController < ApplicationController
  http_basic_authenticate_with :name => "Jisha", :password => "password"

  #skip_before_filter :authenticate_user! 
  before_filter :fetch_user, :except => [:index, :create]

 def fetch_user
    @user = User.find_by_id(params[:id])
  end

  def index
    @users = User.all
    respond_to do |format|
      format.json { render json: @users }
      format.xml { render xml: @users }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @user }
      format.xml { render xml: @user }
    end
  end

  def create
    @user = User.new(params[:user])
   # @user.temp_password = Devise.friendly_token
    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }
        format.xml { render xml: @user, status: :created }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.xml { render xml: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.xml { render xml: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @user.destroy
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.xml { render xml: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
