Dir["./src/*.rb"].each {|file| require file }

puts "------------Welcome------------\nPlease use PLACE x, y, f command first and after that use MOVE, LEFT, RIGHT, REPORT in any sequence.\n"

robot = Robot.new
table = Table.new
command = Command.new robot, table

while true
  begin
    puts "Please enter a command. If you want to quit, please type EXIT."
    input_command = gets.chomp
    break if input_command.downcase == "exit"
    command.parse_and_execute_command input_command
  rescue
    puts "Please try again!"
  end
end

