#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/scraper'

welcome_input = 1
puts "Find your next job!!!"
puts "CHECK OUT SOME JOBS THAT MIGHT BE INTERESTING FOR YOU!!"
puts "What type of jobs are you interested in?"
while welcome_input == 1
  lop = true
  while lop
    puts "Enter exit to finish searching.."
    puts "Enter a job you would like to look for"
    begin
      input = Kernel.gets.chomp.match("[a-zA-Z]+.*").string
    rescue
      puts "---Please do not use only numbers!!---".upcase
    else
      if input.downcase == 'exit'
        welcome_input = 2 
      else
        scraper = Scraper.new()
        jobs = scraper.fetch_data
        jobList = scraper.fetch_job_listing(jobs)
        jobResult = scraper.search_job(jobList, input)
        if jobResult.empty?
          puts "There are not records related to that job, please enter a different one or use a different way to find it"
        else
          jobResult.each do |job|
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
        end
      end
      lop = false
    end
  end
end
