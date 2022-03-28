FactoryBot.define do
  factory :position do
    facing_direction {"east"}
    x_coordinate {3}
    y_coordinate {1}

    initialize_with { Position.new(facing_direction, x_coordinate, y_coordinate) }
  end
end