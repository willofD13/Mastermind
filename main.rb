colors = %w[red blue yellow green black white]

codemaker = []
colors.shuffle.each do |item|
  break if codemaker.length == 4

  codemaker.push(item)
end

gets.chomp.split(',')

def existence(codebreaker, codemaker)
  i = 0
  while i < 4
    codemaker.include?(codebreaker[i])
    p "#{codebreaker[i]} exists" if codemaker.include?(codebreaker[i]) == true
    i += 1
  end
end
