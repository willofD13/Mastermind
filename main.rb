# frozen_string_literal: true
##require 'pry-byebug'
class Game
  
  @@colors = ['red','blue','yellow','green','black','white']
  @@turn = 1

  attr_reader :codemaker,:codebreaker

  def initialize
    @codebreaker = []
    @codemaker = []
  end
  
  def ask_user
    puts "Do you want to be the codemaker or the codebreaker?"
    choice = gets.chomp
      if choice == 'codebreaker'
        maker_pattern
        while @@turn <=12
          breaker_pattern(codebreaker)
          @@turn += 1
        end
      end
    elsif choice == 'codemaker'
  end

  def maker_pattern
    @@colors.shuffle.each do |item|
      break if codemaker.length == 4
      codemaker.push(item)
    end
    p codemaker
  end
  
  def breaker_pattern (codebreaker)
    puts 'Enter your pattern. Please separate your color choices with comma(,)'
    codebreaker = gets.chomp.split(',')
    existence(codebreaker,codemaker)
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
        if codebreaker == codemaker
          puts "You found the pattern!"
          @@turn = 13
          break;
        elsif codebreaker[i].eql?(codemaker[i]) == true
          puts "#{codebreaker[i]} is in the right position"
        end
      i += 1
    end
  end

  def play
    ask_user
  end
end

game = Game.new
game.play
