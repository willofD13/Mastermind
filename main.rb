colors = %w[red blue yellow green black white]

codemaker = []
colors.shuffle.each do |item|
  break if codemaker.length == 4
  codemaker.push(item)
end

puts "Enter your pattern"
codebreaker = gets.chomp.split(',')

def existence(codebreaker, codemaker)
  i = 0
  while i < 4
    codemaker.include?(codebreaker[i])
    p "#{codebreaker[i]} exists" if codemaker.include?(codebreaker[i]) == true
    i += 1
  end
  position(codebreaker,codemaker)
end

def position(codebreaker, codemaker)
  i = 0
  while i < 4
    codebreaker[i].eql?(codemaker[i])
    p "#{codeguess[i]} is in the right position" if codebreaker[i].eql?(codemaker[i]) == true
    i += 1
  end
end

existence(codebreaker,codemaker)