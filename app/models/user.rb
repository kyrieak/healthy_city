class User < ActiveRecord::Base

  attr_accessible :email, :name, :password

  has_many :activities
  has_many :icons, :through => :activities
  has_many :completions, :through => :activities

  def activities_on(date)
    self.activities.group_by{ |a| a.completion(date) }
  end

  def activities_check(date)
    check = Hash.new
    acts = activities_on(date)

    acts[:done].each do |a|
      check[a] = 1
    end
    acts[:not_done].each do |a|
      check[a] = 0
    end
    check
  end

  def completed_cweek(date)
    check_cweek = Hash.new
    activities_cw = days_cweek(date).collect{ |day| activities_check(day) }
    
    self.activities.each do |a|
      check_cweek[a] = activities_cw.inject(0) { |sum, acw| sum + acw[a] }
    end

    check_cweek
  end

#########################################################################

  # def activities_done_cweek(date)
  #   activities_cw = Hash.new
  #   days_cweek(date).each do |day|
  #     activities_cw[day] = activities_done(day)
  #   end
  #   activities_cw
  # end

  # def activities_cweek(date)
  #   activities_cw = Hash.new
  #   days_cweek(date).each do |day|
  #     activities_cw[day] = activities_on(day)
  #   end
  #   activities_cw
  # end

  private

  def checked(date)
    checked = Hash.new(0)
    activities_on(date)[:done].each do |a|
      checked[a] += 1
    end
    checked
  end

  def days_cweek(date)
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

end