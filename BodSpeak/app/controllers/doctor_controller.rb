class DoctorController < ApplicationController
#Controller to handle the dispaly of all users under a doctor
def show
@user=User.where(:user_type=>'P')
@msg=Message.find_by_user_id(@user)
end
end
