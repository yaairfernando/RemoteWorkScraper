#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/scraper'

welcome_input = 1
puts "Find your next job!!!"
while welcome_input == 1
  puts "CHECK OUT SOME JOBS THAT MIGHT BE INTERESTING FOR YOU!!"
  puts "What type of jobs are you interested in?"
  welcome = "Ruby and Rails developer  ==>> TYPE 1  React developer  ==>> TYPE 2" + "\n" + 
            "Java Script Developer  ==>> TYPE 3   FrontEnd Developer  ==>> TYPE 4" + "\n" + 
            "Backedn Developer  ==>> TYPE 5   Software Engineer  ==>> TYPE 6" + "\n" + 
            "All jobs  ==>> TYPE 7"
  puts welcome
  puts "Enter 9 to finish searching.."
  input = gets.chomp.to_i
  while input != 1 && input != 2 && input != 9 && input != 4 && input != 5 && input != 6 && input != 7 && input != 3
    puts "Please select one of the following options:"
    puts welcome
    puts "Enter 9 to finish searching.."
    input = gets.chomp.to_i
  end
  scraper = Scraper.new()
  jobs = scraper.fetch_data
  jobList = scraper.fetch_job_listing(jobs)
  case input
    when 1
      puts "Loading Ruby and Rails jobs....."
      rubyJobs = scraper.ruby_jobs(jobList)
      puts "There are #{rubyJobs.size} jobs that might be interesting for you in Ruby:"
      rubyJobs.each do |job|
        puts "--------------------------"
        puts "Title: #{job[:title]}"
        puts "Company: #{job[:company]}"
        puts "Region: #{job[:region]}"
        puts "Type: #{job[:new]}"
        puts "Status: #{job[:featured]}"
        puts "Description: #{job[:description]}"
        puts "Url: #{job[:url]}"
        puts "--------------------------"
      end
    when 2
      puts "Loading React jobs....."
      reactJobs = scraper.react_jobs(jobList)
      puts "There are #{reactJobs.size} jobs that might be interesting for you in React:"
      reactJobs.each do |job|
        puts "--------------------------"
        puts "Title: #{job[:title]}"
        puts "Company: #{job[:company]}"
        puts "Region: #{job[:region]}"
        puts "Type: #{job[:new]}"
        puts "Status: #{job[:featured]}"
        puts "Description: #{job[:description]}"
        puts "Url: #{job[:url]}"
        puts "--------------------------"
      end
    when 3
      puts "Loading JavaScript jobs....."
      jsJobs = scraper.js_jobs(jobList)
      puts "There are #{jsJobs.size} jobs that might be interesting for you in JavaScript:"
      jsJobs.each do |job|
        puts "--------------------------"
        puts "Title: #{job[:title]}"
        puts "Company: #{job[:company]}"
        puts "Region: #{job[:region]}"
        puts "Type: #{job[:new]}"
        puts "Status: #{job[:featured]}"
        puts "Description: #{job[:description]}"
        puts "Url: #{job[:url]}"
        puts "--------------------------"
      end
    when 4
      puts "Loading FrontEnd jobs....."
      fJobs = scraper.f_jobs(jobList)
      puts "There are #{fJobs.size} Front End jobs:"
      fJobs.each do |job|
        puts "--------------------------"
        puts "Title: #{job[:title]}"
        puts "Company: #{job[:company]}"
        puts "Region: #{job[:region]}"
        puts "Type: #{job[:new]}"
        puts "Status: #{job[:featured]}"
        puts "Description: #{job[:description]}"
        puts "Url: #{job[:url]}"
        puts "--------------------------"
      end
    when 5
      puts "Loading BackEnd jobs....."
      bJobs = scraper.b_jobs(jobList)
      puts "There are #{bJobs.size} Back End jobs:"
      bJobs.each do |job|
        puts "--------------------------"
        puts "Title: #{job[:title]}"
        puts "Company: #{job[:company]}"
        puts "Region: #{job[:region]}"
        puts "Type: #{job[:new]}"
        puts "Status: #{job[:featured]}"
        puts "Description: #{job[:description]}"
        puts "Url: #{job[:url]}"
        puts "--------------------------"
      end
    when 6
      puts "Loading Software Engineer jobs....."
      seJobs = scraper.se_jobs(jobList)
      puts "There are #{seJobs.size} jobs as Software Engineer :"
      seJobs.each do |job|
        puts "--------------------------"
        puts "Title: #{job[:title]}"
        puts "Company: #{job[:company]}"
        puts "Region: #{job[:region]}"
        puts "Type: #{job[:new]}"
        puts "Status: #{job[:featured]}"
        puts "Description: #{job[:description]}"
        puts "Url: #{job[:url]}"
        puts "--------------------------"
      end
    when 7
      puts "Loading all jobs....."
      puts "There are #{jobList.size} jobs that might be interesting for you:"
      jobList.each do |job|
        puts "--------------------------"
        puts "Title: #{job[:title]}"
        puts "Company: #{job[:company]}"
        puts "Region: #{job[:region]}"
        puts "Type: #{job[:new]}"
        puts "Status: #{job[:featured]}"
        puts "Description: #{job[:description]}"
        puts "Url: #{job[:url]}"
        puts "--------------------------"
      end
    when 9
      welcome_input = 2
  end
end
