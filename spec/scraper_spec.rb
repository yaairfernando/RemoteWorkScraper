# frozen_string_literal: true

require_relative './../lib/scraper.rb'

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

  describe '#search_job' do
    it 'when we get the list of jobs related to this specific programming languaje' do
      expect(scraper.search_job([], '')).to eq([])
    end

    it 'when we get the list of jobs and not nil' do
      expect(scraper.search_job([], '')).not_to be([].nil? == false)
    end

    it 'when we get the list of jobs with at least one item' do
      expect(scraper.search_job([], '')).not_to be([].empty?)
    end
  end
end
