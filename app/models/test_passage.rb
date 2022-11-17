 # frozen_string_literal: true

 class TestPassage < ApplicationRecord
   CHECK_RESULT = 85

   belongs_to :user
   belongs_to :test
   belongs_to :current_question, class_name: 'Question', optional: true

   before_validation :before_validation_set_question, on: %i[create update]

   def total_test_questions
     test.questions.count
   end

   def completed?
     current_question.nil?
   end

   def accept!(answer_ids)
     self.correct_questions += 1 if correct_answer?(answer_ids)
     save!
   end

   def percent_correct
     (correct_questions.to_f * 100 / total_test_questions).round(2)
   end

   def success?
     percent_correct >= CHECK_RESULT
   end

   def current_question_position
     test.questions.order(:id).where('id < ?', current_question.id).count + 1
   end

  private

   def before_validation_set_question
     self.current_question = next_question
   end

   def correct_answers
     current_question.answers.correct
   end

   def correct_answer?(answer_ids)
     correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
   end

   def next_question
     if new_record?
       test.questions.first
     else
       test.questions.order(:id).where('id > ?', current_question.id).first
     end
   end
 end
