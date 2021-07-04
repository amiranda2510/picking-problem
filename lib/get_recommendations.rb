# frozen_string_literal: true

require 'json'

# Service to return 4 recommendations between a range of these
class GetRecommendations
  def self.get_data(filename)
    recommendations = File.read(filename)
    JSON.parse(recommendations)
  end

  def self.create_queues(data)
    new_data = []
    data.map { |_key, value| new_data << value.to_a }
    new_data.map { |arr| arr.map { |recommendation| recommendation['token'].to_i } }
  end

  def self.apply_round_robin(logs, content, myad)
    result = []
    n = logs.length + content.length + myad.length
    (0..n).each do |_i|
      result << logs.shift unless logs.empty?
      result.length == 4 ? break : 0

      result << content.shift unless content.empty?
      result.length == 4 ? break : 0

      result << myad.shift unless myad.empty?
      result.length == 4 ? break : 0
    end
    result
  end

  def self.start(filename)
    data = get_data(filename)
    queues = create_queues(data)
    apply_round_robin(queues[0], queues[1], queues[2])
  end
end
