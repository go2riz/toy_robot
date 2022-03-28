class Command
  def initialize robot, table
    @robot, @table = robot, table
  end

  # to parse and execute entered command
  def parse_and_execute_command command
    begin
      cmd = command.split(" ")
      if cmd.size > 1 && cmd.first.downcase == "place"
        position_data = command.split(",")
        execute_place_command(Position.new(position_data[2].strip, position_data[0].split(" ").last.strip.to_i, position_data[1].strip.to_i))
      else
        send "execute_#{cmd.first.downcase}_command"
      end
    rescue
      puts "You entered an invalid command!"
    end
  end

  private

  # to place a robot on table
  def execute_place_command position
    return unless position.is_position_valid? @table
    @robot.robot_current_position = position
  end

  # to move a robot toward right
  def execute_right_command
    return unless @robot.is_robot_on_table?
    @robot.robot_current_position = Position.new(@robot.robot_current_position.get_right_direction, @robot.robot_current_position.x_coordinate, @robot.robot_current_position.y_coordinate)
  end

  # to move a robot towards left
  def execute_left_command
    return unless @robot.is_robot_on_table?
    @robot.robot_current_position = Position.new(@robot.robot_current_position.get_left_direction, @robot.robot_current_position.x_coordinate, @robot.robot_current_position.y_coordinate)
  end

  # to move one step forward
  def execute_move_command
    if @robot.is_robot_on_table?
      next_position = @robot.robot_current_position.perform_move_step
      @robot.robot_current_position = next_position if next_position.is_position_valid? @table
    end
  end

  # to display the report in terminal
  def execute_report_command
    puts report = @robot.is_robot_on_table? ? "#{@robot.robot_current_position.x_coordinate}, #{@robot.robot_current_position.y_coordinate}, #{@robot.robot_current_position.facing_direction}" : "Not on table!"
    return report
  end
end