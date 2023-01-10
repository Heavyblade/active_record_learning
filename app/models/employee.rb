class Employee < ApplicationRecord
  belongs_to :job
  belongs_to :department
end
