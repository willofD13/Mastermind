class Game
  @@pool = ['red','blue','black','white','yellow','green'].repeated_permutation(4).to_a
  
  attr_reader :guess,:answer

  def initialize
    @guess = []
    @answer = []
  end

  def play
    answer = @@pool.sample
    calculate_score(['red','red','blue','blue'],answer)

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

    i = 0
    while i < 4
      b.include?(a[i])
      white_peg += 1 if b.include?(a[i]) == true
      i += 1
    end
    score = "#{white_peg},#{black_peg}"   
    puts score

end
