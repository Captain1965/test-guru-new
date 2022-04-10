class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :difficult, -> { where(level: 5..Float::INFINITY) }
  scope :sort_by_categories, ->(category) {
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
  }

  validates :title, presense: thrue, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }


  def self.names_by_category(name)
   joins(:category)
    .where(categories: { title: name })
    .order(title: :desc)
    .pluck(:title)
  end

end
