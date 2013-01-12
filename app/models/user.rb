class User < ActiveRecord::Base

  attr_accessible :email, :name, :password

  has_many :activities
  has_many :icons, :through => :activities
  has_many :completions, :through => :activities

  def progress(date)
    comp = completions_for_week(date)
    not_comp = not_comp_for_week(comp)
    {:complete => comp, :not_complete => not_comp}
  end

#########################################################################

  private

  def completions_for_week(date)
    comp = Hash.new
    days_of_week(date).each do |day|
      comp[day] = completions_on(day)
    end
    comp
  end

  def not_comp_for_week(comp)
    not_comp = Hash.new
    comp.each do |day, c|
      not_comp[day] = self.activities.reject{ |a| comp[a] }
    end
    not_comp
  end


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