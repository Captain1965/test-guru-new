class UserTest < ApplicationRecord
  belong_to :test
  belong_to :user
end
