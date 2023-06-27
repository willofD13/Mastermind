class Game
  @@turn = 1

  attr_accessor :guess,:answer,:all_answers

  def initialize
    @all_answers = ['red','blue','black','green','white','yellow'].repeated_permutations(4).to_a
    @guess = []
    @answer = []
    @all_scores = Hash.new {|h,k| h[k] = {}}
  end 
  
  def play 
    answer = all_answers.sample
    @possible_answers = all_answers.dup 
    @possible_scores = all_scores.dup
    while @@turn <=12
      @guess = make_guess
      if all_answers.include?(guess)
        @@turn += 1
        @score = calculate_score(guess,answer)
        if @score = '0,4'
          puts 'Pattern found'
          break
        end
      end
    end 
  end

  first_guess = ['red','red','blue','blue']
 
  

  def calculate_score (guess,answer)
    a = []
    b = []
    white_peg = 0
    black_peg = 0
    score = ''
    
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
      if i[0] == i[1]
        white_peg += 1
      end
    end
    score = "#{white_peg},#{black_peg}"   
    puts score
  end
end

game = Game.new