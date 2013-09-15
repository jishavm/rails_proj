class DoctorController < ApplicationController
def show
@user=User.where(:user_type=>'P')
@msg=Message.find_by_user_id(@user)
end
end
