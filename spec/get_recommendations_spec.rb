require 'get_recommendations'

RSpec.describe GetRecommendations do

  it "scenario 1" do
    result = GetRecommendations::start("spec/scenario1.json")
    expect(result.length).to equal(1)
    expect(result).to match_array([345048])
  end

  it "scenario 2" do
    result = GetRecommendations::start("spec/scenario2.json")
    expect(result.length).to equal(4)
    expect(result).to match_array([790952, 103678, 788138, 802358])
  end

  it "scenario 3" do
    result = GetRecommendations::start("spec/scenario3.json")
    expect(result.length).to equal(4)
    expect(result).to match_array([103678, 790952, 802358, 788138])
  end

  it "scenario 4" do
    result = GetRecommendations::start("spec/scenario4.json")
    expect(result.length).to equal(4)
    expect(result).to match_array([790952, 103678, 802358, 562873])
  end

end