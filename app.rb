require 'sinatra/base'
require './lib/player'
require './lib/game'
#Test

class Battle < Sinatra::Base
  enable :sessions

  # This is a sinatra filter (@game is used in every route)
  before do
    @game = Game.instance
  end

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    @game = Game.create(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  get '/attack' do
    @game.attack
    @game.switcher
    redirect '/game_over' if @game.game_over?
    erb :attack
  end

  get '/game_over' do
    erb :game_over
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
