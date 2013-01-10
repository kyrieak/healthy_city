class User < ActiveRecord::Base

  attr_accessible :email, :name, :password

  has_many :activities
  has_many :icons, :through => :activities
  has_many :completions, :through => :activities

  def completions_for_week(date)
    comp = Hash.new
    days_of_week(date).each do |day|
      comp[day] = completions_on(day)
    end
    comp
  end

#########################################################################

  def completions_on(date)
    comp = self.completions.where({ :date => date })
    comp.group_by{ |c| c.activity }
  end

  def days_of_week(date)
    day = date
    week = []

    until day.sunday?
      week << day
      day = day.prev_day
    end

    day = date
    week.reverse!

    until day.monday?
      week << day
      day = day.next
    end
    week
  end

end