class Robot
  attr_accessor :robot_current_position

  # to verify whether robot is on table or not
  def is_robot_on_table?
    !robot_current_position.nil?
  end
end