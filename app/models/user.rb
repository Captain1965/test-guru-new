class User < ApplicationRecord
  def test_level_by_user(level)
    Test
    .joins("JOIN tests ON author_id = users.id")
    .where(level: level, user: { user_id: id })
  end
end
