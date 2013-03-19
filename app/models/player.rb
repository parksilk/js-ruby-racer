class Player < ActiveRecord::Base
  validates :name, :presence => :true
  validates :name, :uniqueness => :true
  # Remember to create a migration!
end
