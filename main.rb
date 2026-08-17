active_proj = []
completed_proj = []
loop do
  puts "=== Project Tracker (RUBY) ==="
  puts "\n1. View Projects"
  puts "2. Add Project"
  puts "3. Complete Project"
  puts "4. Exit"
  puts "Choose an option:"
  option = gets.chomp.to_i

  case option
  when 1
    puts "Here are your active projects:\n#{active_proj}"
    puts "Here are your completed projects: \n#{completed_proj}"

  when 2
    puts "What is the name of the project you would like to add?"
    new_proj = gets.chomp.downcase
    active_proj << new_proj
    puts "Great! Your project has been added"
  when 3
    puts "Active projects: #{active_proj}"
    puts "Which project have you completed?"
    complete_input = gets.chomp.downcase
    if active_proj.include?(complete_input)
        active_proj.delete(complete_input)
        completed_proj << complete_input
        puts "#{complete_input} has been moved to your completed projects! Congrats on finishing!"
    else
        puts "#{complete_input} is not one of your projects. Please double check your spelling. Your active projects are as follows: #{active_proj}"
    end
    when 4
    puts "Are you sure you want to leave?"
    leave = gets.chomp.downcase
    if leave == "yes"
        break
    else
        puts "Okay."
    end
  end
end