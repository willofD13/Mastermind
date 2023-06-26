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


  def play
    ask_user
  end

  private 

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
    calculate_score(codebreaker, codemaker)
  end

  def calculate_score(codebreaker, codemaker)
    a = []
    b = []
    white_peg = 0
    black_peg = 0
    
    i = 0
    while i < 4
      codebreaker[i].eql?(codemaker[i])
      if codebreaker == codemaker
        puts 'You found the pattern!'
        @@turn = 13
        break
      elsif codebreaker[i].eql?(codemaker[i]) == true
        black_peg += 1
      else a.push(codebreaker[i])
           b.push(codemaker[i])
      end
      i += 1
    end

    i = 0
    while i < 4
      b.include?(a[i])
      white_peg += 1 if b.include?(a[i]) == true
      i += 1
    end

    puts "#{white_peg},#{black_peg}"
  end

end

game = Game.new
game.play
