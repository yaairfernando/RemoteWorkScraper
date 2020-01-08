require 'nokogiri'
require 'httparty'
require 'byebug'
require 'open-uri'

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
  jobList.each do |jobItem|
    react << jobItem if jobItem[:title].include?("React") || jobItem[:title].include?("Redux")
    ruby << jobItem if jobItem[:title].include?("Rails") || jobItem[:title].include?("Ruby")
    js << jobItem if jobItem[:title].include?("EC6") || jobItem[:title].include?("JavaScript")
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
end

scraper