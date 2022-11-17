# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :answers_limit, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def answers_limit
    errors.add(:question, 'the number of responses is limited to 4') if question.answers.count >= 4
  end
end
