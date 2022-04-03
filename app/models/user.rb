class User < ApplicationRecord
  has_many :tests, foreign_key: "author_id"
  has_and_belongs_to_many :tests
  def tests_by_level(level)
    Test
      .joins('JOIN tests_users ON tests.id = tests_users.test_id')
      .where(level: level, tests_users: { user_id: id })
  end
end
