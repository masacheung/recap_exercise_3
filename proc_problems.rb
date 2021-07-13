class String
    # String#select
    # Extend the string class by defining a String#select method that accepts a block.
    # The method should return a new string containing characters of the original string that return true when passed into the block.
    # If no block is passed, then return the empty string. Do not use the built-in Array#select in your solution.
    def select(&proc)
        ans = ""
        return "" if proc == nil
        self.each_char do |char|
            ans += char if proc.call(char)
        end
        ans
    end

    # String#map!
    # Extend the string class by defining a String#map! method that accepts a block. The method should modify the existing string by
    # replacing every character with the result of calling the block, passing in the original character and it's index.
    # Do not use the built-in Array#map or Array#map! in your solution.
    def map!(&proc)
        self.each_char.with_index do |char, i|
            self[i] = proc.call(char, i) if proc.call(char, i)
        end
        self
    end
end

# Examples
p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""

# Examples
word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"