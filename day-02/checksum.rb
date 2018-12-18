doubles_count = 0
triples_count = 0


File.read('input.txt').split("\n").each do |id|
  sequences = id.chars.each_with_object(Hash.new(0)) { |c, seq| seq[c] += 1 }.invert

  doubles_count += 1 if sequences[2]
  triples_count += 1 if sequences[3]
end

puts "Checksum: #{doubles_count * triples_count}"

def check_match(first_str, second_str)
  allow_misses = 1
  matched_chars = []

  misses = 0
  first_str.chars.each_with_index do |c, i|
    if c == second_str[i]
      matched_chars << c
    else
      misses += 1
    end

    break if misses > allow_misses
  end

  [misses <= allow_misses, matched_chars]
end

scanned_ids = File.open('input.txt').readlines.map(&:chomp)

scanned_ids.each_with_index do |origin_id, i|
  scanned_ids[(i + 1)..-1].each do |candidate_id|
    is_close_enough, check_result = check_match(origin_id, candidate_id)

    if is_close_enough
      puts check_result.join('')
      exit
    end
  end
end
