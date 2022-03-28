FactoryBot.define do
  factory :command do
    initialize_with { Command.new(robot, table) }
  end
end