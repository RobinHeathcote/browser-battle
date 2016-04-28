class Game

  attr_reader :player_1, :player_2, :current_player, :opponent

  def initialize(player_1, player_2)
  	@player_1 = player_1
  	@player_2 = player_2
    @current_player = player_1
    @opponent = player_2
  end

  def self.create(player_1, player_2)
  	@game = Game.new(player_1, player_2)
  end

  def self.instance
  	@game
  end

  def attack
    @opponent.receive_damage(Kernel.rand(1..10))
  end

  def switcher
    @current_player, @opponent = @opponent, @current_player
  end

  def game_over?
    @current_player.hit_points <= 0
  end
end
