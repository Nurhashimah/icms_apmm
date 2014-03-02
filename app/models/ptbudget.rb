class Ptbudget < ActiveRecord::Base
  validates_presence_of :budget, :fiscalstart
end
