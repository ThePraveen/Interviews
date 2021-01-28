
# Enjoy your interview!
  
# Matrix:
#  1  2  3
#  4  5  6
#  7  8  9
# Output:
#  3  6  9 
#  2  5  8 
#  1  4  7 
# The given matrix is rotated by 90 degree 
# in anti-clockwise direction.

# Input:
#  1  2  3  4 
#  5  6  7  8 
#  9 10 11 12 
# 13 14 15 16 
# Output:
#  4  8 12 16 
#  3  7 11 15 
#  2  6 10 14 
#  1  5  9 13

def printA(a)
  n = a.length
  for i in 0..n-1
    for j in 0..n-1
      print a[i][j].to_s + " "
    end
    puts
  end  
end

def rotate(a, n)
  return a if n <= 1
  layers = n/2-1
  for i in 0..layers
    for j in i..n-i-2
      printA(a)
      puts
      temp = a[i][j]
      a[i][j] = a[j][n-i-1]
      a[j][n-i-1] = a[n-i-1][n-j-1]
      a[n-i-1][n-j-1] = a[n-j-1][i]
      a[n-j-1][i] = temp
    end        
  end
  return a
end


a = [[1,2,3], [4,5,6], [7,8,9]]    
n = 3    
printA(a)
rotate(a, n)
printA(a)
a = [[1,2,3,4],[5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]
n = 4
printA(a)
rotate(a, n)
printA(a)


def fib_subset(arr)
  s = Set.new
  n1 = 0
  n2 = 1
  i = n1 + n2
  while(i <= arr.max)
    s.add(i)
    n1 = n2
    n2 = i
    i = n1 + n2
  end
  out = []
  arr.each do |e|
    out << e if s.include?(e)
  end
  out
end


arr = [1, 4, 3, 9, 10, 13, 7]
fib_subset(arr)

arr = [0, 2, 8, 5, 2, 1, 4, 13, 23];
fib_subset(arr)


def pair_with_diff_k(arr,k)
  s = Set.new(arr)
  count = 0
  arr.each do |e|
    count+=1 if s.include?(e+k)
    count+=1 if s.include?(e-k)
  end
  count/2
end


arr = [1, 5, 3, 4, 2]
k = 3
pair_with_diff_k(arr,k)

arr = [8, 12, 16, 4, 0, 20]
k = 4
pair_with_diff_k(arr,k)


def say(a)
  out = ""
  n = a.to_s.length
  i = 0
  while(i<n)
    count = 1
    while(i < n-1 && a[i]==a[i+1])
      count+=1
      i+=1
    end
    out = out + count.to_s + a[i]
    i+=1
  end
  out
end

def look_n_say(n)
  out = "1"
  while(n>1)
    out = say(out)
    n-=1
  end
  out
end

look_n_say(3)


def rearrange_sum(a)
  char_count = {}
  n = a.length
  sum = 0
  for i in 0..n-1
    if a[i].ord >= 'A'.ord && a[i].ord <= 'Z'.ord
      char_count[a[i]] = char_count.has_key?(a[i]) ? char_count[a[i]]+1 : 1
    else
      sum += a[i].to_i
    end    
  end
  out = ""
  char_count.keys.sort.each do |char|
    out += char*char_count[char]
  end
  out+=sum.to_s
  out
end
rearrange_sum("AC2BEW3")



def roman_to_dec(a)
  roman_to_dec_map = {'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C'=> 100, 'D' => 500, 'M' => 1000}
  n = a.length
  num = 0
  for i in 0..n-1
    if(i < n-1 && roman_to_dec_map[a[i]] < roman_to_dec_map[a[i+1]])
      num-=roman_to_dec_map[a[i]]
    else
      num+=roman_to_dec_map[a[i]]
    end    
  end
  num
end
roman_to_dec("MCMIV")

def dec_to_roman(num)
  dec_to_roman_map = {1 => 'I', 5 => 'V', 10 => 'X', 50 => 'L', 100=> 'C', 500 => 'D', 1000 => 'M'}
  rom_map = {}
  rom_map['ones'] = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
  rom_map['tens'] = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
  rom_map['hundreds'] = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
  rom_map['thousands'] = ["", "M", "MM", "III", "IV", "V", "VII", "VIII", "IX"]
  thousands = num/1000
  hundreds = (num%1000)/100
  tens = (num%100)/10
  ones = num%10
  rom_map['thousands'][thousands] + rom_map['hundreds'][hundreds] + rom_map['tens'][tens] + rom_map['ones'][ones]
end
dec_to_roman(1)
dec_to_roman(1904)

[1, 4, 45, 6, 0, 19]

def smallest_sub_with_sum(arr, n, x)
  i = j = curr_sum = 0
  min = n+1

  while(j < n)    
    while(j < n && curr_sum <= x)
      curr_sum+=arr[j]
      j+=1
    end    
    while(i <= j && curr_sum > x)
      curr_sum-=arr[i]
      i+=1
    end    
    if min > j-i+1
      min = j-i+1
    end
  end  
  min
end

smallest_sub_with_sum([1, 4, 45, 6, 0, 19], 6, 51)
smallest_sub_with_sum([], 0, 51)


def lcs(a, b, n, m)
  if (n==0 || m==0)
    return 0
  elsif (a[n-1] == b[m-1])
    return 1 + lcs(a,b,n-1, m-1)
  else
    return [lcs(a,b,n, m-1) ,  lcs(a,b,n-1, m)].max
  end  
end

a = "AGGTAB" 
b = "GXTXAYB"
n = 6
m = 7
lcs(a, b, n, m)

def lcs_dp(a, b, n, m)
  dp = Array.new(n){Array.new(m,0)}
  
  for i in 0..n
    for j in 0..m
      if(i==0 || j == 0)
        dp[i][j] = 0        
      elsif(a[i-1] == a[j-1])
        dp[i][j] = 1 + dp[i-1][j-1]
      else
        dp[i][j] = [dp[i][j-1], dp[i-1][j]].max
      end      
    end
  end
  dp[n][m]
end

a = "AGGTAB" 
b = "GXTXAYB"
n = 6
m = 7
lcs_dp(a, b, n, m)


def min_diff_helper(a, n, p1, p2, dp)
  if(n==0)
    dp[0][p1] = (p1-p2).abs 
    return (p1-p2).abs 
  end  
  
  i = 0
  if (dp[n-1][p1+a[n-1] == 0])
    i = min_diff_helper(a, n-1, p1+a[n-1], p2-a[n-1], dp)
  else
    i = dp[n-1][p1+a[n-1]]
  end

  j = 0
  if (dp[n-1][p1] == 0)
    j = min_diff_helper(a, n-1, p1, p2, dp)
  else
    j = dp[n-1][p1]
  end
    
  dp[n,p1] = [i,j].min
  return dp[n,p1]
end
  
def min_diff(a,n)
  sum = a.sum
  dp = Array.new(n){Array.new(sum, 0)}  
  min_diff_helper(a, n, 0, sum, dp)
  return dp[n][sum]
end
  
a = [1, 6, 11, 5]
min_diff(a,a.length)

class Node
  attr_accessor :data, :left, :right  
  def initialize(data)
    @data = data
  end
  
end

def expression_to_tree(str)
  return nil if str.length == 0
  first_q = str.index("?")
  first_colon = str.index(":")
  return Node.new(str) if first_q.nil?
  
  root = Node.new(str[0..first_q-1])
  root.left = expression_to_tree(str[first_q+1..first_colon])
  root.right = expression_to_tree(str[first_colon+1..-1])
  return root
end

str = "a?b:c"
expression_to_tree(str)
