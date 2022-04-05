class User < ApplicationRecord
  has_many :created_tests, class_name:"tests", dependent: :destroy, foreign_key: "author_id"
  has_many :tests, through: :user_tests

  def test_by_level(level)
    tests.where(level: level)
  end
end
