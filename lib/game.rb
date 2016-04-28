class Game

  attr_reader :player_1, :player_2, :current_player, :opponent


  def initialize(player_1, player_2)
  	@player_1 = player_1
  	@player_2 = player_2
    @current_player = player_1
    @opponent = player_2
  end

  def attack
    @opponent.receive_damage
  end

  def switcher
    @current_player, @opponent = @opponent, @current_player
  end
end
