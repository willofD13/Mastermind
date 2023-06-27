class Game
  def initialize
    @all_answers = ['red','blue','black','green','white','yellow'].repeated_permutations(4).to_a
    @guess = []
    @answer = []
end 

game = Game.new