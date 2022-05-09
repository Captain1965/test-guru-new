class User < ApplicationRecord
  has_many :created_tests, class_name:"tests", dependent: :destroy, foreign_key: "author_id"
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :email, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def test_by_level(level)
    tests.where(level: level)
  end
end
