require 'sinatra/base'
require './lib/player'
require './lib/game'
#Test

class Battle < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  get '/play' do
    @player_1 = $player_1
    @player_2 = $player_2
    erb :play

  end

  get '/attack' do
    @name_1 = $player_1.name
    @name_2 = $player_2.name
    Game.new.attack($player_2)
    @HP_1 = $player_1.hit_points
    @HP_2 = $player_2.hit_points
    erb :attack
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
