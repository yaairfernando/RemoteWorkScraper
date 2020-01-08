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

  def ruby_jobs(job_list)
    ruby = []
    job_list.each do |job_item|
      ruby << job_item if job_item[:title].include?('Rails') || job_item[:title].include?('Ruby')
    end
    ruby
  end

  def react_jobs(job_list)
    react = []
    job_list.each do |job_item|
      react << job_item if job_item[:title].include?('React') || job_item[:title].include?('Redux')
    end
    react
  end

  def js_jobs(job_list)
    js = []
    job_list.each do |job_item|
      js << job_item if job_item[:title].include?('JavaScript') || job_item[:title].include?('EC6')
    end
    js
  end

  def f_jobs(job_list)
    front = []
    job_list.each do |job_item|
      front << job_item if job_item[:title].include?('Front')
    end
    front
  end

  def b_jobs(job_list)
    back = []
    job_list.each do |job_item|
      back << job_item if job_item[:title].include?('Back')
    end
    back
  end

  def se_jobs(job_list)
    se = []
    job_list.each do |job_item|
      se << job_item if job_item[:title].include?('Software')
    end
    se
  end
end
