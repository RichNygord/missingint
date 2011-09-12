# Solution to the missing_int problem and some tests.
# By Richard Nygord 9/8/2011
# Test instructions/runs are in the final block comment.

module MissingInt

  # Return the missing number in an array sized n containing numbers in range (1..n+1) in linear time with no additional size complexity.
  # I left in the intermediate soultions to show my thought process.

  def self.mi ar
    return -1 if ar == []
    n=ar.length
    
    #using new bit array
    #b=Array.new(n+2,true) #start with all missing with room for 0 and n+1
    #ar.each {|v| b[v]=false}  #record not missing ones
    #b[0]=false
    #b.index true          #return only the missing one
    
    #using signs in a new array
    #m=[0]+ar+[n+1]
    #ar.each {|v| m[v]=-m[v]}  #record not missing ones
    #m.index {|v| v>0}     #return only the missing one
    
    #using signs in the existing array - linear + in place storage
    ar.unshift 0
    ar.push n+1
    (1..n).each {|i| ar[ar[i].abs] = -ar[ar[i].abs]}  #record not missing ones in sign-bit of index of value remebering that values must be asbed!
    
    res = ar.index {|v| v>0} #missing one is left positive
    ar.shift
    ar.pop
    ar.length.times {|i| ar[i] = ar[i].abs}  #ta...
    res                                      #da!
  end
end


class Array
  def missing_int
    MissingInt.mi self
  end
end


