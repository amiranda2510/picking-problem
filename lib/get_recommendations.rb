require 'json'

class GetRecommendations
  
  def self.get_data(filename)
    recommendations = File.read(filename)
    JSON.parse(recommendations)
  end

  def self.create_queues(data)
    new_data = []
    data.map { |key, value| new_data << value.to_a }
    new_data = new_data.map { |arr| arr.map{ |recommendation| recommendation["token"].to_i } }
    new_data
  end

  def self.apply_round_robin(logs, content, myad)
    result = []
    n = logs.length + content.length + myad.length
    for i in 0..n do
      if !logs.empty? 
        result << logs.shift
      end 
      result.length == 4 ? break : 0
      if !content.empty? 
        result << content.shift
      end 
      result.length == 4 ? break : 0
      if !myad.empty?
        result << myad.shift
      end 
      result.length == 4 ? break : 0
    end
    result
  end

  def self.start(filename)
    data = self.get_data(filename)
    queues = self.create_queues(data)
    apply_round_robin(queues[0], queues[1], queues[2])
  end
end 
