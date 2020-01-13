# frozen_string_literal: true

require 'nokogiri'
require 'httparty'
require 'byebug'

class Scraper
  attr_reader :url
  attr_accessor :job_listing
  def initialize
    @url = 'https://weworkremotely.com/#job-listings'
    self.job_listing = []
  end

  def fetch_data
    html = HTTParty.get(@url)
    data = Nokogiri::HTML(html)
    jobs = data.css('div.jobs-container section.jobs article ul li')
    jobs
  end

  def fetch_job_listing(job_list)
    job_listing
    job_list.each do |job_item|
      job = {
        title: job_item.css('a span.title').text,
        company: job_item.css('a span.company').text,
        region: job_item.css('a span.region').text,
        new: job_item.css('span.new').text,
        featured: job_item.css('a span.featured').text,
        description: job_item.css('a  span:nth-child(6)').text,
        url: 'https://weworkremotely.com' + job_item.xpath('a/@href').first.value
      }
      job_listing << job
    end
    job_listing
  end

  def search_job(job_list, input)
    job_result = []
    job_list.each do |job_item|
      job_result << job_item if job_item[:title].downcase.include?(input.downcase)
    end
    job_result
  end
end
