require 'csv'

def hangman_selected_word
  file_path = "words.csv"


# Valid words for our hangman
words = []
CSV.foreach(file_path) do | row |
  word = row[0].strip
  words << word
end

hangman_words = []
words.each do |word|
  if word.length > 5 && word.length < 12
    hangman_words << word
  end
end

random_number = rand(0...hangman_words.length)

# Selected word to guess
$selected_word = hangman_words[random_number]

# return selected_word

# Know how many spaces the word will have and apply those spaces
number_of_spaces = rand(3..4)
character_count = Hash.new(0)


$word_with_spaces = ""

$selected_word.each_char do |character|
  random_number = rand(1..2)
  if random_number == 1 && character_count["_"] < number_of_spaces
    $word_with_spaces << "_"
    character_count["_"] += 1
  else
    $word_with_spaces << character
  end
end

# Know the index of the spaces
$spaces_index = []

$word_with_spaces.each_char.with_index do | char, index |
  if char == "_"
    $spaces_index << index
  end
end

# Create an Array with the correct letters
$correct_letters = []

$spaces_index.each do | index |
  $correct_letters << $selected_word[index]
end


puts "Palabra con espacios #{$word_with_spaces} palabra real #{$selected_word} letras faltantes #{$correct_letters}"


end

hangman_selected_word
