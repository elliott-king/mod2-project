class Company < ActiveRecord::Base
  has_many :positions

  def self.have_multiple_positions
    self.all.select {|c| Position.where(company: c).count > 1}
  end
end