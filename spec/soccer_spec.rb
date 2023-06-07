require "soccer"

RSpec.describe "soccer" do
  it "reads the content of the .dat file" do
    file_path = "football.dat"
    file_reader = Soccer.new(file_path)

    content = file_reader.read_file

    expect(content).to eq "Team"
  end

  it "returns the name of the smallest difference" do
    file_path = "football.dat"
    file_reader = Soccer.new(file_path)

    team = file_reader.smallest_difference

    expect(team).to eq "Aston_Villa"
  end
end
