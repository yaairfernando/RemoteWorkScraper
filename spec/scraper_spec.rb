# frozen_string_literal: true

require './lib/scraper.rb'

RSpec.describe 'RemoteWork Scraper' do
  scraper = Scraper.new

  describe '#fetch_data' do
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

  describe '#fetch_job_listing' do
    it 'when we fetch the job listing from the array and get another array with the job list' do
      expect(scraper.fetch_job_listing([])).to eq([])
    end

    it 'when we fetch the job listing from the array and get more than 150 jobs in the list' do
      expect(scraper.fetch_job_listing([])).not_to be([].size < 150)
    end
  end
end
