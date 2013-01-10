namespace :db do

  task :populate => :environment do
    @akari = User.create!({ :name => "Akari", :email => "a@a.com", :password => "aa" })

    Icon.where(:id => [8..12].to_a).each do |icon|
      Activity.create!({ :user_id => @akari.id, :icon_id => icon.id, :label => "A #{icon.id}",
        :description => "nete tabete asonde mata neru" })
    end

    @akari.activities.each_with_index do |a, index|
      if index.odd?
        Completion.create!({ :activity_id => a.id, :date => Date.today })
      else
        Completion.create!({ :activity_id => a.id, :date => Date.today.prev_day })
      end
    end
  end
end