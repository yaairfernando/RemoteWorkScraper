#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/scraper'

input = 1
# while welcome_input == 1
  puts "WELCOME...CHECK OUT SOME JOBS THAT MIGHT BE INTERESTING FOR YOU!!"
  puts "What type of jobs are you interested in?"
  welcome = "Ruby and Rails developer  ==>> TYPE 1" + "\n" + "React developer  ==>> TYPE 2" + "\n" + "Java Script Developer  ==>> TYPE 3"
  puts welcome
  input = gets.chomp.to_i
  while input != 1 && input != 2 && input != 3
    puts "Please select one of the following options:"
    puts welcome
    input = gets.chomp.to_i
  end
  case input
    when 1
      print "Loading Ruby and Rails jobs....."
      scraper = Scraper.new()
      jobs = scraper.getData
      jobList = scraper.getJobListing(jobs)

      rubyJobs = scraper.rubyJobs(jobList)
      p rubyJobs.size
      rubyJobs.each do |job|
        p job
      end
    when 2
      print "Loading React jobs....."
    when 3
      print "Loading JavaScript jobs....."
  end
# end
