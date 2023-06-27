#equire 'pry-byebug'

class Computer
  @@turn = 1

  attr_accessor :guess,:answer,:all_answers,:all_scores

  def play 
    answer = all_answers.sample
    @possible_answers = all_answers.dup 
    @possible_scores = all_scores.dup
    while @@turn <=12
      guess = make_guess
      if all_answers.include?(guess)
        @@turn += 1
        @score = calculate_score(guess,answer)
        if @score == '0,4'
          @@turn = 13
          puts 'Pattern found'
          break
        end
      end
    end 
  end


  def calculate_score (guess,answer)
    a = []
    b = []
    white_peg = 0
    black_peg = 0
    score = ''
    
    i = 0
    while i < 4
      guess[i].eql?(answer[i])
      if guess[i].eql?(answer[i]) == true
        black_peg += 1
      else a.push(guess[i])
           b.push(answer[i])
      end
      i += 1
    end

    a.each do |peg|
      if b.include?(peg)
        b.delete(peg)
        white_peg += 1
      end
    end
    score = "#{white_peg},#{black_peg}"   
    score
  end

  def initialize
    @all_answers = ['red','blue','black','green','white','yellow'].repeated_permutation(4).to_a
    @guess = []
    @answer = []
    @all_scores = Hash.new {|h,k| h[k] = {}}
   
    @all_answers.product(@all_answers).each do |guess,answer|
      @all_scores[guess][answer] = calculate_score(guess,answer)
    end
  end 
  
  
  def make_guess
    if @@turn == 1
      guess = ['red','red','blue','blue']
    elsif @@turn > 1
      pool = @possible_answers.keep_if {|answer|
        @possible_scores[guess][answer] == @score
      }
      puts pool.size
      guess = pool.sample

    end
  end

end

game = Computer.new 
game.play
