# frozen_string_literal: true

class Game
  
  @@colors = ['red','blue','yellow','green','black','white']
  @@turn = 1

  attr_reader :colors

  def initialize
    @codebreaker = []
    @codemaker = []
  end

  def maker_pattern
    @@colors.shuffle.each do |item|
      break if codemaker.length == 4
      codemaker.push(item)
  end
  
  def breaker_pattern 
    puts 'Enter your pattern'
    codebreaker = gets.chomp.split(',')
    p codebreaker
  end
    

  def existence(codebreaker, codemaker)
    i = 0
    while i < 4
      codemaker.include?(codebreaker[i])
      p "#{codebreaker[i]} exists" if codemaker.include?(codebreaker[i]) == true
      i += 1
    end
    position(codebreaker, codemaker)
  end

  def position(codebreaker, codemaker)
    i = 0
    while i < 4
      codebreaker[i].eql?(codemaker[i])
      p "#{codebreaker[i]} is in the right position" if codebreaker[i].eql?(codemaker[i]) == true
      i += 1
    end
  end
end

game = Game.new
existence(codebreaker, codemaker)
