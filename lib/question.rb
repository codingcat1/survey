class Question < ActiveRecord::Base
  belongs_to :survey

  before_save :capitalize_first

private

  def capitalize_first
    self.question = self.question.capitalize
  end

end
