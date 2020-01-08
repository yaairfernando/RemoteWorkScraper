require 'nokogiri'
require 'httparty'
require 'byebug'
require 'open-uri'

class Scraper
  attr_reader :url
  # attr_accessor :jobListing
  def initialize
    @url = 'https://weworkremotely.com/#job-listings'
    @jobListing = Array.new
  end

  def getData
    data = Nokogiri::HTML(open(@url))
    jobs = data.css('div.jobs-container section.jobs article ul li')
    jobs
  end

  def getJobListing(jobList)
    @jobListing
    jobList.each do |jobItem|
      job = {
        title: jobItem.css('a span.title').text,
        company: jobItem.css('a span.company').text,
        region: jobItem.css('a span.region').text,
        new: jobItem.css('span.new').text,
        featured: jobItem.css('a span.featured').text,
        description: jobItem.css('a  span:nth-child(6)').text,
        url: "https://weworkremotely.com" +  jobItem.xpath('a/@href').first.value
      }
      @jobListing << job
    end
    @jobListing
  end

  def rubyJobs(jobList)
    ruby = Array.new
    jobList.each do |jobItem|
      ruby << jobItem if jobItem[:title].include?("Rails") || jobItem[:title].include?("Ruby")
    end
    ruby
  end

  def reactJobs(jobList)
    react = Array.new
    jobList.each do |jobItem|
      react << jobItem if jobItem[:title].include?("React") || jobItem[:title].include?("Redux")
    end
    react
  end

  def jsJobs(jobList)
    js = Array.new
    jobList.each do |jobItem|
      js << jobItem if jobItem[:title].include?("JavaScript") || jobItem[:title].include?("EC6")
    end
    js
  end

end

def scraper
  url = 'https://weworkremotely.com/#job-listings'
  # unparsed_page = HTTParty.get(url)
  data = Nokogiri::HTML(open(url))
  # byebug
  # jobs = data.css('section#category-2 article ul li')
  jobs = data.css('div.jobs-container section.jobs article ul li')
  jobList = Array.new
  jobs.each do |jobItem|
    job = {
      title: jobItem.css('a span.title').text,
      company: jobItem.css('a span.company').text,
      region: jobItem.css('a span.region').text,
      new: jobItem.css('span.new').text,
      featured: jobItem.css('a span.featured').text,
      description: jobItem.css('a  span:nth-child(6)').text,
      url: "https://weworkremotely.com" +  jobItem.xpath('a/@href').first.value
    }
    jobList << job
  end
  ruby = Array.new
  react = Array.new
  js = Array.new
  front_end = Array.new
  back_end = Array.new
  full_stack = Array.new
  software_engineer = Array.new
  jobList.each do |jobItem|
    react << jobItem if jobItem[:title].include?("React") || jobItem[:title].include?("Redux")
    ruby << jobItem if jobItem[:title].include?("Rails") || jobItem[:title].include?("Ruby")
    js << jobItem if jobItem[:title].include?("EC6") || jobItem[:title].include?("JavaScript")
    front_end << jobItem if jobItem[:title].include?("Front")
    back_end << jobItem if jobItem[:title].include?("Back")
    full_stack << jobItem if jobItem[:title].include?("Full")
    software_engineer << jobItem if jobItem[:title].include?("Software")
  end
  p "There are #{ruby.size} jobs in Rails"
  ruby.each do |rubyJob|
    p rubyJob
  end
  p "There are #{react.size} jobs in React"
  react.each do |reactJob|
    p reactJob
  end
  p "There are #{js.size} jobs in JS"
  js.each do |jsJob|
    p jsJob
  end
  p "There are #{front_end.size} jobs in Front end"
  front_end.each do |fJob|
    p fJob
  end

  p "There are #{back_end.size} jobs in Back End"
  back_end.each do |bJob|
    p bJob
  end

  p "There are #{full_stack.size} jobs in Full Stack"
  full_stack.each do |fJob|
    p fJob
  end

  p "There are #{software_engineer.size} jobs in Payton"
  software_engineer.each do |fJob|
    p fJob
  end
end

# scraper