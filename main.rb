# frozen_string_literal: true

# #require 'pry-byebug'
class Game
  @@colors = %w[red blue yellow green black white]
  @@turn = 1

  attr_reader :codemaker, :codebreaker

  def initialize
    @codebreaker = []
    @codemaker = []
  end

  def ask_user
    puts 'Do you want to be the codemaker or the codebreaker? 
    Codebreaker has 12 attempts to break the pattern. Duplicates and blanks are not allowed.'
    choice = gets.chomp
    return unless choice == 'codebreaker'

    maker_pattern
    while @@turn <= 12
      breaker_pattern(codebreaker)
      @@turn += 1
    end
  end

  def maker_pattern
    @@colors.shuffle.each do |item|
      break if codemaker.length == 4

      codemaker.push(item)
    end
    p codemaker
  end

  def breaker_pattern(codebreaker)
    puts 'Enter your pattern. Please separate your color choices with comma(,)'
    codebreaker = gets.chomp.split(',')
    existence(codebreaker, codemaker)
  end

  def existence(codebreaker, codemaker)
    x = 0
    i = 0
    while i < 4
      codemaker.include?(codebreaker[i])
      x += 1 if codemaker.include?(codebreaker[i]) == true
      i += 1
    end
    if x <= 1
      puts "#{x} color exists in code pattern"
    elsif x > 1
      puts "#{x} colors exist in code pattern"
    end
    position(codebreaker, codemaker)
  end

  def position(codebreaker, codemaker)
    y = 0
    i = 0
    while i < 4
      codebreaker[i].eql?(codemaker[i])
      if codebreaker == codemaker
        puts 'You found the pattern!'
        @@turn = 13
        break
      elsif codebreaker[i].eql?(codemaker[i]) == true
        y += 1
      end
      i += 1
    end
    if y <= 1
      puts "#{y} is in the right position"
    elsif y > 1
      puts "#{y} are in the right position"
    end
  end

  def play
    ask_user
  end
end

game = Game.new
game.play
