class PatientInfo < ActiveRecord::Base
  #Patient info model. This has to belong to a user(patient user) and also has the option to set 
  #anonymous='Y' incase the patient wants to post anonymously
  attr_accessible :age, :anonymous, :gender
  belongs_to :user
  accepts_nested_attributes_for :age, :anonymous, :gender
end
