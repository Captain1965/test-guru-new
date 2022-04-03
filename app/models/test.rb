class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions
  has_and_belongs_to_many :users

  def self.names_by_category(name)
    joins('JOIN categories ON categories.id = tests.category_id')
      .where(categories: { title: name }).pluck(:title)
  end

end
