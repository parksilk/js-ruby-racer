class Game < ActiveRecord::Base
  validate :only_two_players
  

  private
  def only_two_players
    
  end
end
