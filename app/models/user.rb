class User < ActiveRecord::Base
  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :middle_initial, presence: true

  def add_star!
    self.no_stars+=1
  end
end
