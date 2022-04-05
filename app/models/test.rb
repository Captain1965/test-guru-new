class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :users, through: :user_tests

  def self.names_by_category(name)
    joins(:category)
    .where(categories: { title: name })
    .order(title: :desc)
    .pluck(:title)
  end

end
