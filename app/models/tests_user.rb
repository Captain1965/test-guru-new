class TestsUser < ApplicationRecord
  has_many :tests, dependent: :destroy
  has_many :users, dependent: :destroy
end
