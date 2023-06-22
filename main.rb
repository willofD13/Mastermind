colors = ['red','blue','yellow','green','black','white']

codemaker = []
colors.shuffle.each do |item|
  break if codemaker.length == 4
  codemaker.push(item)
end