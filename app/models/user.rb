class User < ActiveRecord::Base

  attr_accessible :email, :name, :password

  has_many :activities
  has_many :icons, :through => :activities
  has_many :completions, :through => :activities

  def activity_totals_for_cweek(date)
    totals = Hash.new

    self.activities.each do |a|
      totals[a] = cweek_total_for(a, date)
    end
    totals
  end

#########################################################################

  def days_in_cweek(date)
    days = [date]
    current_day = date.prev_day

    until current_day.sunday?
      days << current_day
      current_day = current_day.prev_day
    end
    
    days.reverse!
    current_day = date.next
    
    until current_day.monday?
      days << current_day
      current_day = current_day.next
    end

    days
  end

  def activities_on(date)
    check = Hash.new
    self.activities.each do |a|
      a.done?(date) ? (check[a] = 1) : (check[a] = 0)
    end
    check
  end

  def cweek_total_for(a, date)
    results = days_in_cweek(date).collect do |day|
      activities_on(day)[a]
    end
    results.inject(:+)
  end

end