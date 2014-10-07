a = %w(i am a banana)
#a = ['i', 'am', 'a', 'banana']

for i in 0..a.length-1
  print a[i], ' '
end

puts

a.each do |el| print el, ' ' end