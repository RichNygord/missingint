#missingint.rb
# By Richard Nygord 
# Created 9/8/2011
# Modified 9/25/2011 to add the arithmetic version using: 1+ 2+ ... + n = n(n+1)/2
# Return the missing number in an array sized n containing numbers in range (1..n+1) in linear time with no additional size complexity.  Add missing_int to Array.

module MissingInt

  def self.mi1 ar
    return -1 if ar == []
    n=ar.length
    
    # Using sign-bit in the existing array - linear + in place storage
    ar.unshift 0
    ar.push n+1
    (1..n).each {|i| ar[ar[i].abs] = -ar[ar[i].abs]}  #record not missing ones in sign-bit of index of value remebering that values must be asb-ed!
    
    res = ar.index {|v| v>0} #missing one is left positive
    ar.shift
    ar.pop
    ar.length.times {|i| ar[i] = ar[i].abs}  #ta...
    res                                      #da!
  end

  # Here is a *much* better one using this: 1+ 2+ ... + n = n(n+1)/2
  def self.mi2 ar
    (ar.length+1) * (ar.length+2) / 2 - ar.inject(:+)
  end
  
end

class Array
  def missing_int
    MissingInt.mi2 self
  end
end

