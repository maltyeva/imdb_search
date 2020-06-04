class Director < ApplicationRecord
  has_many :movies, dependent: :destroy

  def full_name
    self.first_name + " " + self.last_name
  end
end
