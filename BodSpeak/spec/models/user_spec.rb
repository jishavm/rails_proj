# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'
describe User do
    before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

 # before { @user = User.new(name: "Example User", email: "user@example.com") }

  subject { @user }
  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:messages) }
  
  end

