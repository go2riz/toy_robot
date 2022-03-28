require './src/table'
require './src/position'
require './spec/factories/table'
require './spec/factories/position'

describe Position do

  describe "get right direction" do

    it "facing south and after taking right will face west" do
      position = FactoryBot.build(:position, facing_direction: "south")
      expect(position.get_right_direction).to eq "west"
    end

    it "facing west and after taking right will face north" do
      position = FactoryBot.build(:position, facing_direction: "west")
      expect(position.get_right_direction).to eq "north"
    end

    it "facing north and after taking right will face east" do
      position = FactoryBot.build(:position, facing_direction: "north")
      expect(position.get_right_direction).to eq "east"
    end

    it "facing east and after taking right will face south" do
      position = FactoryBot.build(:position, facing_direction: "east")
      expect(position.get_right_direction).to eq "south"
    end
  end

  describe "get left direction" do

    it "facing south and after taking left will face east" do
      position = FactoryBot.build(:position, facing_direction: "south")
      expect(position.get_left_direction).to eq "east"
    end

    it "facing east and after taking left will face north" do
      position = FactoryBot.build(:position, facing_direction: "east")
      expect(position.get_left_direction).to eq "north"
    end

    it "facing north and after taking left will face west" do
      position = FactoryBot.build(:position, facing_direction: "north")
      expect(position.get_left_direction).to eq "west"
    end

    it "facing west and after taking left will face south" do
      position = FactoryBot.build(:position, facing_direction: "west")
      expect(position.get_left_direction).to eq "south"
    end
  end

  describe "perform move step" do

    it "when moves to south" do
      current_position = FactoryBot.build(:position, facing_direction: "south")
      next_position = current_position.perform_move_step
      expect(next_position.y_coordinate).to eq current_position.y_coordinate - 1
    end

    it "when moves to west" do
      current_position = FactoryBot.build(:position, facing_direction: "west")
      next_position = current_position.perform_move_step
      expect(next_position.x_coordinate).to eq current_position.x_coordinate - 1
    end

    it "when moves to north" do
      current_position = FactoryBot.build(:position, facing_direction: "north")
      next_position = current_position.perform_move_step
      expect(next_position.y_coordinate).to eq current_position.y_coordinate + 1
    end

    it "when moves to east" do
      current_position = FactoryBot.build(:position, facing_direction: "east")
      next_position = current_position.perform_move_step
      expect(next_position.x_coordinate).to eq current_position.x_coordinate + 1
    end
  end

  describe "is_position_valid?" do
    table = FactoryBot.build(:table)

    context "when position is valid" do
      it "when facing south" do
        position = FactoryBot.build(:position, facing_direction: "south")
        expect(position.is_position_valid?(table)).to be true
      end

      it "when facing west" do
        position = FactoryBot.build(:position, facing_direction: "west")
        expect(position.is_position_valid?(table)).to be true
      end

      it "when facing north" do
        position = FactoryBot.build(:position, facing_direction: "north")
        expect(position.is_position_valid?(table)).to be true
      end

      it "when facing east" do
        position = FactoryBot.build(:position, facing_direction: "east")
        expect(position.is_position_valid?(table)).to be true
      end
    end

    context "when position is not valid" do
      it "when facing south" do
        position = FactoryBot.build(:position, facing_direction: "south", y_coordinate: -1)
        expect(position.is_position_valid?(table)).to be false
      end

      it "when facing west" do
        position = FactoryBot.build(:position, facing_direction: "west", x_coordinate: -1)
        expect(position.is_position_valid?(table)).to be false
      end

      it "when facing north" do
        position = FactoryBot.build(:position, facing_direction: "north", y_coordinate: 6)
        expect(position.is_position_valid?(table)).to be false
      end

      it "when facing east" do
        position = FactoryBot.build(:position, facing_direction: "east", x_coordinate: 6)
        expect(position.is_position_valid?(table)).to be false
      end
    end
  end

end