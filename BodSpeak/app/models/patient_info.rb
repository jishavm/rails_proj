class PatientInfo < ActiveRecord::Base
  attr_accessible :age, :anonymous, :gender
  belongs_to :user
  accepts_nested_attributes_for :age, :anonymous, :gender
end
