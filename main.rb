# frozen_string_literal: true

class Game
  
  @@turn = 1

  def initialize
    @colors = ['red','blue','yellow','green','black','white']
  end

  codemaker = []
  colors.shuffle.each do |item|
    break if codemaker.length == 4

    codemaker.push(item)
  end

  puts 'Enter your pattern'
  gets.chomp.split(',')

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
