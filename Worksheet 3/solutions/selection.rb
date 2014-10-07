def collate(arr)
  arr.inject({})  { |res, el|
    value = res[el]
    if value
      res[el] = value + 1
    else
      res[el] = 1
    end
    res
  }
end

print collate(['one', 'two', 'one'])
print collate([1, 'three', 'one', 1])

