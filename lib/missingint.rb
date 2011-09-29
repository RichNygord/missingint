#missingint.rb
# By Richard Nygord 
# Created 9/8/2011
# Modified 9/25/2011 to add the arithmetic version using: 1+ 2+ ... + n = n(n+1)/2
# Added C version 9/28/2011
# Return the missing integer in an array sized n, containing integers in range (1..n+1), not ordered, in linear time with no additional size complexity.  Add missing_int to Array.

class Array
  def missing_int
    (self.length+1) * (self.length+2) / 2 - self.inject(0, :+)  # 1+ 2+ ... + n = n(n+1)/2
  end
end


=begin

And, just for the hell of it, here is my C version:

int missing_int(int n, int* ints)
{
  int result = (n + 1) * (n + 2) / 2;
  while (n--) result -= *ints++;
  return result;
}

=end
