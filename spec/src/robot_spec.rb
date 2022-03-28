require './src/robot'
require './src/position'
require './spec/factories/robot'
require './spec/factories/position'

describe Robot do

  describe "is_robot_on_table?" do
    context "when robot is not on table" do
      robot = FactoryBot.build(:robot)
      it "should return false" do
        expect(robot.is_robot_on_table?).to be false
      end
    end

    context "when robot is on table" do
      robot = FactoryBot.build(:robot, robot_current_position: FactoryBot.build(:position))
      it "should return true" do
        expect(robot.is_robot_on_table?).to be true
      end
    end
  end

end