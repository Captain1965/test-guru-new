class User < ApplicationRecord
  has_many :created_tests, class_name:"tests", dependent: :destroy, foreign_key: "author_id"
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  validates :email, presence: true

  def test_by_level(level)
    tests.where(level: level)
  end
end
