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
  puts "*** ADD A SURVEY ***\n"
  puts "Please type the name of the Survey you would like to add:"
  survey_name = gets.chomp
  survey = Survey.new(:name => survey_name)
  if survey.save
    puts "'#{survey_name}' has been added to the list of Surveys. "
  else
    puts "Not a valid Survey name, please try again:\n"
    survey.errors.full_messages.each{ |message| puts message }
  end
end

def add_question
  puts "*** ADD A QUESTION ***\n"
  puts "Please choose a Survey to add a question to:"
  Survey.all.each do | survey |
    puts "#{survey.name}\n"
  end
  survey_input = gets.chomp
  add_to_survey = Survey.find_by(:name => survey_input)
  puts "Please type a question that you would like to add to #{survey_input}:"
  question_input = gets.chomp
  question = Question.new(:question => question_input)
  question.update(:survey_id => add_to_survey.id)
  question.save
  puts "Your question has been added!"
end




welcome
