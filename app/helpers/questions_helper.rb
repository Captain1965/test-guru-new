# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    if question.persisted?
      "Edit question : #{question.body}"
    else
      'Create question'
    end
  end
end
