get '/' do
  erb :index
end

post '/' do
  # takes player1 and player2 from index.erb form as params
  # if the players are not already in the database, we create them
  # load the page that has the gameplay
  # render preserves instance variables

  puts params["player_1"]

  player1 = Player.find_or_create_by_name(:name => params["player_1"])
  player2 = Player.find_or_create_by_name(:name => params["player_2"])
  @game = Game.create(:player1_id => player1.id,
                      :player2_id => player2.id)




  # create the game
  # add the player names to the game

  erb :game
end

post '/results/:game_id' do
  @game_id = :game_id
  erb :results
end
