class Position
  attr_accessor :facing_direction, :x_coordinate, :y_coordinate
  FACING_DIRECTIONS = %w{south west north east}

  def initialize facing_direction, x_coordinate, y_coordinate
    @facing_direction, @x_coordinate, @y_coordinate = facing_direction, x_coordinate, y_coordinate
  end

  # to get right side direction of current facing direction
  def get_right_direction
    FACING_DIRECTIONS.index(facing_direction) == ( FACING_DIRECTIONS.size - 1 ) ? FACING_DIRECTIONS[0] : FACING_DIRECTIONS[FACING_DIRECTIONS.index(facing_direction) + 1]
  end

  # to get left side direction of current facing direction
  def get_left_direction
    FACING_DIRECTIONS.index(facing_direction) == 0 ? FACING_DIRECTIONS[FACING_DIRECTIONS.size - 1] : FACING_DIRECTIONS[FACING_DIRECTIONS.index(facing_direction) - 1]
  end

  # to perform move
  def perform_move_step
    # switch is more efficient as compared to nested ifs
    case facing_direction
      when "south"
        Position.new(facing_direction, x_coordinate, y_coordinate - 1)
      when "west"
        Position.new(facing_direction, x_coordinate - 1, y_coordinate)
      when "north"
        Position.new(facing_direction, x_coordinate, y_coordinate + 1)
      when "east"
        Position.new(facing_direction, x_coordinate + 1, y_coordinate)
    end
  end

  # to validate position
  def is_position_valid? table
    x_coordinate >= 0 && x_coordinate <= table.width && y_coordinate >= 0 && y_coordinate <= table.length
  end
end