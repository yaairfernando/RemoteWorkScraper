# frozen_string_literal: true

require './lib/scraper.rb'

RSpec.describe 'RemoteWork Scraper' do

  describe '#fetch_data' do
    scraper = Scraper.new
    it 'when we fetch the data from the webside and do not get an empty array' do
      expect(scraper.fetch_data).not_to be([])
    end

    it 'when we fetch the data from the webside and get one node' do
      expect(scraper.fetch_data).not_to be([].size > 1)
    end

    it 'when we fetch the data from the webside and no not get a nil' do
      expect(scraper.fetch_data).not_to be([].nil? == false)
    end
  end
  

end