# no_dupes?
# Write a method no_dupes?(arr) that accepts an array as an arg and returns an new array containing the elements that were not repeated
# in the array.

p "----------"
p "no_dupes?"
p "----------"

def no_dupes?(array)
    hash = Hash.new(0)
    array.each do |ele|
        hash[ele] += 1
    end
    ans = []
    hash.each do |k, v|
        if v == 1
            ans << k
        end
    end
    ans
end

# Examples
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []

# no_consecutive_repeats?
# Write a method no_consecutive_repeats?(arr) that accepts an array as an arg.
# The method should return true if an element never appears consecutively in the array; it should return false otherwise.

p "----------"
p "no_dno_consecutive_repeats?"
p "----------"

def no_consecutive_repeats?(array)
    return true if array.length == 1
    (0...array.length-1).each do |i|
        if array[i] == array[i+1]
            return false
        end
    end
    true
end

# Examples
p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true

# char_indices
# Write a method char_indices(str) that takes in a string as an arg. The method should return a hash containing characters as keys.
# The value associated with each key should be an array containing the indices where that character is found.

p "----------"
p "char_indices"
p "----------"

def char_indices(str)
    hash = Hash.new {}
    str.each_char.with_index do |char, i|
        if hash[char] == nil
            hash[char] = [i]
        else
            hash[char] << i
        end
    end
    hash
end

# Examples
p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

# longest_streak
# Write a method longest_streak(str) that accepts a string as an arg. The method should return the longest streak of consecutive
# characters in the string. If there are any ties, return the streak that occurs later in the string.

p "----------"
p "longest_streak"
p "----------"

def longest_streak(str)
    ans = ""
    temp = ""
    (0...str.length).each do |i|
        if str[i] == str[i-1] || i == 0
            temp += str[i]
        else
            temp = str[i]
        end
        ans = temp if temp.length >= ans.length
    end
    ans
end

# Examples
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'

# bi_prime?
# Write a method bi_prime?(num) that accepts a number as an arg and returns a boolean indicating whether or not
# the number is a bi-prime. A bi-prime is a positive integer that can be obtained by multiplying two prime numbers.

# For Example:

# 14 is a bi-prime because 2 * 7
# 22 is a bi-prime because 2 * 11
# 25 is a bi-prime because 5 * 5
# 24 is not a bi-prime because no two prime numbers have a product of 24

p "----------"
p "bi_prime?"
p "----------"

def bi_prime?(num)
    arr = []
    (0...num).each do |ele|
        arr << ele if is_prime?(ele)
    end

    (0...arr.length).each do |i|
        (i...arr.length).each do |j|
            return true if arr[i] * arr[j] == num
        end
    end
    false
end

def is_prime?(num)
    return false if num < 2
    (2...num).each do |ele|
        return false if num % ele == 0
    end
    true
end


# Examples
p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false

# vigenere_cipher
# A Caesar cipher takes a word and encrypts it by offsetting each letter in the word by a fixed number, called the key.
# Given a key of 3, for example: a -> d, p -> s, and y -> b.

# A Vigenere Cipher is a Caesar cipher, but instead of a single key, a sequence of keys is used. For example,
# if we encrypt "bananasinpajamas" with the key sequence 1, 2, 3, then the result would be "ccqbpdtkqqcmbodt":

# # Message:  b a n a n a s i n p a j a m a s
# # Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# # Result:   c c q b p d t k q q c m b o d t
# Write a method vigenere_cipher(message, keys) that accepts a string and a key-sequence as args, returning the encrypted message.
# Assume that the message consists of only lowercase alphabetic characters.

p "----------"
p "vigenere_cipher"
p "----------"

def vigenere_cipher(str, arr)
    alp = ("a".."z").to_a
    ans = ""
    str.each_char.with_index do |char, i|
        num = (i+1) % arr.length
        alp_i = alp.index(char)
        num_ch = (alp_i + arr[num-1]) % 26
        ans += alp[num_ch]
    end
    ans
end

# Examples
p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

# vowel_rotate
# Write a method vowel_rotate(str) that accepts a string as an arg and returns the string where every vowel is replaced
# with the vowel the appears before it sequentially in the original string. The first vowel of the string should be replaced with
# the last vowel.

p "----------"
p "vowel_rotate"
p "----------"

def vowel_rotate(str)
    vowels = "aeiou"
    str.each_char.with_index do |char, i|
        if vowels.include?(char)
            num = change(str[i..-1])
            str[i], str[num] = str[num], str[i]
        end
    end
    str
end

def change(str)
    vowels = "aeiou"
    (1..str.length).each do |i|
        if vowels.include?(str[-i])
            return -i
        end
    end
end

# Examples
p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"