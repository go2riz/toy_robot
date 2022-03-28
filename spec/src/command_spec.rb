require './src/table'
require './src/robot'
require './src/command'
require './spec/factories/table'
require './spec/factories/robot'
require './spec/factories/command'

describe Command do
  describe "parse and execute command" do
    table = FactoryBot.build(:table)
    robot = FactoryBot.build(:robot)
    command = FactoryBot.build(:command, robot: robot, table: table)

    context "robot not on table" do
      it "right command" do
        position = command.parse_and_execute_command "right"
        expect(position).to eq nil
      end

      it "left command" do
        position = command.parse_and_execute_command "left"
        expect(position).to eq nil
      end

      it "move command" do
        position = command.parse_and_execute_command "move"
        expect(position).to eq nil
      end

      it "report command" do
        result = command.parse_and_execute_command "report"
        expect(result).to eq "Not on table!"
      end
    end

    context "valid position" do
      it "place command" do
        position = command.parse_and_execute_command "place 5, 0, east"
        expect([position.x_coordinate, position.y_coordinate, position.facing_direction]).to eq [5, 0, "east"]
      end
    end

    context "invalid position" do
      it "place command" do
        position = command.parse_and_execute_command "place 6, 0, east"
        expect(position).to eq nil
      end

      it "move command" do
        position = command.parse_and_execute_command "move"
        expect(position).to eq nil
      end
    end

    context "robot on table" do
      it "right command" do
        position = command.parse_and_execute_command "right"
        # now facing direction is set to south
        expect(position.facing_direction).to eq "south"
      end

      it "left command" do
        position = command.parse_and_execute_command "left"
        # left of south will be east
        expect(position.facing_direction).to eq "east"
      end

      it "move command" do
        # first move robot to left to set a valid position for move
        command.parse_and_execute_command "left"
        # now facing direction is set to north
        position = command.parse_and_execute_command "move"
        # new position is (5, 1, north)
        expect([position.x_coordinate, position.y_coordinate, position.facing_direction]).to eq [5, 1, "north"]
      end

      it "report command" do
        result = command.parse_and_execute_command "report"
        # current position is (5, 1, north)
        expect(result).to eq "5, 1, north"
      end
    end

  end
end