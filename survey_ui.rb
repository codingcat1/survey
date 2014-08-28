require 'active_record'
require './lib/question'
require './lib/survey'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['development'])

def welcome
  system 'clear'
  puts "*** WELCOME TO SURVEY ***"
  menu
end

def menu
  choice = nil
  until choice == 'x'
    puts "Press '1' to add a Survey"
    puts "Press '2' to add a Question"
    puts "Press '3' to add a Possible Response"
    puts "Press 'x' to EXIT"
    choice = gets.chomp
    case choice
    when '1'
      add_survey
    when '2'
      add_question
    when '3'
      add_answer
    when 'x'
      puts "OK BYE"
      sleep(1)
      system 'clear'
    else
      puts 'Sorry, not a valid entry'
    end
  end
end

def add_survey
end

welcome
