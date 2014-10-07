def f(count, &block)
  value = 1
  for i in 1..count
    value = value * i
    block.call(i, value)
  end
end

f(5) do |i, value| puts "f(#{i})=#{value}" end