projects = {}
require "json"
if File.exist?("projects.json") 
    File.open("projects.json", "r") do |file|
        saved_projects = file.read
        projects = JSON.parse(saved_projects)
    end
else
active_proj = []
completed_proj = []
projects = {
    "active" => active_proj,
    "completed" => completed_proj
}
end
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
    puts "Here are your active projects:\n#{projects["active"]}"
    puts "Here are your completed projects: \n#{projects["completed"]}"

  when 2
    puts "What is the name of the project you would like to add?"
    new_proj = gets.chomp.downcase
    projects["active"] << new_proj
    puts "Great! Your project has been added"
  when 3
    puts "Active projects: #{projects["active"]}"
    puts "Which project have you completed?"
    complete_input = gets.chomp.downcase
    if projects["active"].include?(complete_input)
        projects["active"].delete(complete_input)
        projects["completed"] << complete_input
        puts "#{complete_input} has been moved to your completed projects! Congrats on finishing!"
    else
        puts "#{complete_input} is not one of your projects. Please double check your spelling. Your active projects are as follows: #{projects["active"]}"
    end
  when 4
    puts "Are you sure you want to leave?"
    leave = gets.chomp.downcase
    if leave == "yes"
        break
    else
        puts "Okay."
    end
else 
    puts "Invalid option. Please choose 1-4."
  end
end
File.open("projects.json", "w") do |file|
    file.write projects.to_json
end
