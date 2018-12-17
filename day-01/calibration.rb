require 'set'

frequencies = File.readlines('input.txt').map(&:to_i)

puts "Resulting frequency: #{frequencies.sum}"

checked_frequencies = Set.new
current_frequency = 0

loop do
  frequencies.each do |freq|
    current_frequency += freq

    if checked_frequencies.include?(current_frequency)
      puts "First reached twice: #{current_frequency}"
      exit
    end

    checked_frequencies.add(current_frequency)
  end
end
