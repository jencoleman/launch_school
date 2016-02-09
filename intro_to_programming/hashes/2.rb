#merge is temporary, and merge! permamently changes the inputs

hash1 = { :a => 12, :b => 13, :c => 14 }
hash2 = { :d => 15, :e => 16, :f => 17 }

hash1.merge(hash2)
puts hash1
puts hash2
hash1.merge!(hash2)
puts hash1
puts hash2