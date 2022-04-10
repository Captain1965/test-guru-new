class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }
  validates :body, presence: true
  validate :answers_limit

  def answer_limit
    errors.add(:question, 'the number of responses is limited to 4') if question.answers.count >= 4
  end
end
