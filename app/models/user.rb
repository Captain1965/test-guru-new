class User < ApplicationRecord
  has_many :tests, dependent: :destroy, foreign_key: "author_id"
  has_many :tests, through: :user_tests

  belongs_to :tests_user

  def tests_by_level(level)
    Test
      .joins('JOIN tests_users ON tests.id = tests_users.test_id')
      .where(level: level, tests_users: { user_id: id })
  end
end
