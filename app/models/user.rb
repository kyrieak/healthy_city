class User < ActiveRecord::Base

  attr_accessible :email, :name, :password

  has_many :activities
  has_many :icons, :through => :activities
  has_many :completions, :through => :activities

  def progress(days)
    prog = Hash.new()
    days.each { |day| prog[day] = activities_status(day) }
    prog
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

  def activities_status(date)
    status = Hash.new
    status[:done] = activities_done(date)
    status[:not_done] = self.activities.reject{ |a| status[:done].include?(a) }
    status
  end


  def activities_done(date)
    comp = self.completions.where({ :date => date })
    comp.collect{ |c| c.activity }
  end

end