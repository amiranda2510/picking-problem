# frozen_string_literal: true

require 'get_recommendations'

RSpec.describe GetRecommendations do
  it 'scenario 1' do
    result = GetRecommendations.start('spec/scenario1.json')
    expect(result.length).to equal(1)
    expect(result).to match_array([345_048])
  end

  it 'scenario 2' do
    result = GetRecommendations.start('spec/scenario2.json')
    expect(result.length).to equal(4)
    expect(result).to match_array([790_952, 103_678, 788_138, 802_358])
  end

  it 'scenario 3' do
    result = GetRecommendations.start('spec/scenario3.json')
    expect(result.length).to equal(4)
    expect(result).to match_array([103_678, 790_952, 802_358, 788_138])
  end

  it 'scenario 4' do
    result = GetRecommendations.start('spec/scenario4.json')
    expect(result.length).to equal(4)
    expect(result).to match_array([790_952, 103_678, 802_358, 562_873])
  end
end
