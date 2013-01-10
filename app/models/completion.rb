class Completion < ActiveRecord::Base
  attr_accessible :activity_id, :date, :week, :year

  before_save :set_week_and_year

  belongs_to :activity

  private

  def set_week_and_year
    self.week = self.date.cweek
    self.year = self.date.cwyear
  end

end
