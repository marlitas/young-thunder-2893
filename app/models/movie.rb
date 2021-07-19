class Movie < ApplicationRecord
  belongs_to :studio
  has_many :roles
  has_many :actors, through: :roles

  def average_age
    (actors.sum(:age)/actors.length.to_f).round(2)
  end
end
