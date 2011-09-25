#missingint.rb
# By Richard Nygord 
# Created 9/8/2011
# Modified 9/25/2011 to add the arithmetic version using: 1+ 2+ ... + n = n(n+1)/2
# Return the missing integer in an array sized n, containing integers in range (1..n+1), not ordered, in linear time with no additional size complexity.  Add missing_int to Array.

module MissingInt

  def self.mi ar
    raise RuntimeError, 'no missing integers for empty Array' if ar == []
    (ar.length+1) * (ar.length+2) / 2 - ar.inject(:+)  # 1+ 2+ ... + n = n(n+1)/2
  end
  
end

class Array
  def missing_int
    MissingInt.mi self
  end
end

