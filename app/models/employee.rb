class Employee < ActiveRecord::Base
  attr_accessible :dateOfBirth, :employeeCode, :name
  has_many :support_cases
end
