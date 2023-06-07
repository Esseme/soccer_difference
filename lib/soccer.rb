class Soccer
  def initialize(file_path)
    @file_path = file_path
  end

  def read_file
    first_row = File.open(@file_path, "r") do |file|
      file.each_line.first
    end

    first_row[7..10]
  end

  def smallest_difference
    data = File.read(@file_path)
    lines = data.split("\n")
    lines.shift(1)
    team_data = lines.map do |line|
      next unless line.match?(/^\s*\d/)
      columns = line.split(/\s{2,}/)
      team_name = extract_team_name(columns[1])
      goals_for = parse_goal_value(columns[6])
      goals_against = parse_goal_value(columns[8])
      goal_difference = (goals_for - goals_against).abs
      [team_name, goal_difference]
    end.compact

    team_data.min_by { |_, difference| difference }&.first
  end

  private

  def parse_goal_value(value)
    value.to_i if value.match?(/^\d+$/)
  end

  def extract_team_name(column)
    column.sub(/^\s*\d+\.\s*/, "").strip
  end
end
