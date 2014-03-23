class InputData
  def self.always_0
    process(fetch_file_contents('lib/input_data/always_0.tsv'))
  end

  def self.fetch_file_contents(file_name)
    IO.readlines(file_name)
  end

  def self.process(lines)
    lines.reject! {|line| line.nil? || line[0] == '#'}
    lines.map! {|line| line.strip}
    array_of_hashes = lines.map {|line| process_line(line)}
    return array_of_hashes
  end

  def self.process_line(line)
    {inputs: extract_inputs(line), expected_output: extract_output(line)}
  end

  def self.extract_inputs(line)
    pairs = break_line_into_pairs(line).reject {|pairs| pairs[0] == 'output'}
    convert_pairs_to_hash(pairs)
  end

  def self.extract_output(line)
    pairs = break_line_into_pairs(line).find_all {|pairs| pairs[0] == 'output'}
    convert_pairs_to_hash(pairs)
  end

  def self.break_line_into_pairs(line)
    line.split(/\s+/).map {|elem| elem.split(':')}
  end

  def self.convert_pairs_to_hash(pairs)
    ::Hash[pairs.map {|key, value| [key, value]}]
  end
end
