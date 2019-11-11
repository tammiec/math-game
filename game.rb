require './player'

class Game

  attr_accessor :new_turn, :end_game, :p1, :p2, :end_turn, :game_active, :winner, :current_player

  @current_player
  @game_active
  @winner

  def initialize
    @p1 = Player.new(1)
    @p2 = Player.new(2)
    self.current_player = p1
    self.game_active = true
    self.new_turn
  end

  def new_turn

    puts "------ NEW TURN ------"

    num1 = rand(1..20)
    num2 = rand(1..20)
    answer = num1 + num2

    puts "Player #{self.current_player.num}: What does #{num1} plus #{num2} equal?"
    user_answer = gets.chomp.to_i

    if answer == user_answer
      puts "Player #{self.current_player.num}: You're right!! Smarty pants."
    else 
      self.current_player.lives -= 1
      puts "Player #{self.current_player.num}: You're wrong!! Dumb-dumb."
    end

    self.end_turn

  end

  def end_turn
    if self.current_player == p1
      self.current_player = p2
    else 
      self.current_player = p1
    end

    puts "P1: #{p1.lives}/3 vs P2: #{p2.lives}/3"

    self.end_game

  end
  
  
  def end_game

    if p1.lives == 0 || p2.lives == 0
      self.game_active = false

      if p1.lives > p2.lives 
        self.winner = p1
      else
        self.winner = p2
      end
  
      puts "------ GAME OVER ------"
      puts "Player #{self.winner.num} wins with a score of #{self.winner.lives}/3"
      puts "Thanks for playing, come again!"
    else 
      self.new_turn
    end

  end
  

end