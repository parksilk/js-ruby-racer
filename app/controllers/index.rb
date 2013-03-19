get '/' do
  erb :index
end

post '/' do
  # takes player1 and player2 from index.erb form as params
  # if the players are not already in the database, we create them
  # load the page that has the gameplay
  # render preserves instance variables

  puts params["player_1"]

  @player1 = Player.find_or_create_by_name(:name => params["player_1"])
  @player2 = Player.find_or_create_by_name(:name => params["player_2"])
  @game = Game.create(:player1_id => @player1.id,
                      :player2_id => @player2.id)
  session[:game_id] = @game.id
  # create the game
  # add the player names to the game

  erb :game
end


post '/results' do
  
  @game = Game.find_by_id(session[:game_id])
  winner = params[:sql].to_i
  @game.update_attribute('winner_id', winner)
  ''
end

get '/results/:url' do
  @game   = Game.find_by_id(params["url"])
  @winner = Player.find_by_id(@game.winner_id)
  erb :results
end
