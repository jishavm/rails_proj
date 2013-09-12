require 'spec_helper'

describe Message do

  let(:user) { FactoryGirl.create(:user) }
  before { @message = user.messages.build(content: "Lorem ipsum") }

  subject { @message }

  it { should respond_to(:content) }
  it { should respond_to(:patient_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to patient_id" do
      expect do
        Message.new(patient_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "when patient_id is not present" do
    before { @message.patient_id = nil }
    it { should_not be_valid }
  end
end