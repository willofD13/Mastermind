require 'pry-byebug'
class Game
  @@pool = ['red','blue','black','white','yellow','green'].repeated_permutation(4).to_a
  
  attr_reader :guess,:answer

  def initialize
    @guess = []
    @answer = []
    @all_scores = Hash.new {|h,k| h[k] = {}}
  end

  def play
    answer = @@pool.sample
    first_score = calculate_score(['red','red','blue','blue'],answer)
    store(first_score,answer)
  end

  def calculate_score (guess,answer)
    a = []
    b = []
    white_peg = 0
    black_peg = 0
    score = 0
    
    i = 0
    while i < 4
      guess[i].eql?(answer[i])
      if guess == answer
        puts 'You found the pattern!'
        @@turn = 13
        break
      elsif guess[i].eql?(answer[i]) == true
        black_peg += 1
      else a.push(guess[i])
           b.push(answer[i])
      end
      i += 1
    end
    
    c = a.zip(b)
    c.each do |i|
      i.each do |element|
        if element[0] == element[1]
          white_peg += 1
        end
      end
    end
    score = "#{white_peg},#{black_peg}"   
    return score
  end

  def store (first_score,answer)
    binding.pry
    @@pool.each do |item|
      @all_scores[item] = calculate_score(item,answer)
    end
    new_pool = @@pool.keep_if { |element| @all_scores[element] == first_score}
    p new_pool
  end

end

game = Game.new
game.play
