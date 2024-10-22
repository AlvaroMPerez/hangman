def gameplay()
  errors = 0
max_errors = 6

while errors < max_errors
  puts HANGMANPICS[errors]
  puts $word_with_spaces

  # Recibimos la letra del usuario
  begin
    puts "Give me your letter!"
    letter = String(gets.chomp.downcase)
  rescue ArgumentError => e
    puts "Thats not a correct, must be an Integer #{e.message}"
  end

  # We see if the letter is a correct letter


  $word_with_spaces.each_char.with_index do |char, index|
    if char == letter
      $word_with_spaces[index] == letter
    end
  end

  # Delete
  if $correct_letters.include?(letter)
    index_to_delete = $correct_letters.index(letter)
    $correct_letters.delete_at(index_to_delete) if index_to_delete
    $selected_word.each_char.with_index do | char, index |
      if char == letter && $word_with_spaces[index] == "_"
        $word_with_spaces[index] = letter
      end
    end
  else
    errors += 1
  end


  if $correct_letters.empty?
    puts "cool you win"
    break
  end

  puts "Letras restantes por adivinar: #{$correct_letters}"

  if errors == max_errors
    puts "Game over!"
  end
end
end
