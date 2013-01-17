namespace :db do

  task :populate => :environment do
    @ki = User.create!({ :name => "Ki", :email => "k@k.com", :password => "kk" })

    icon_files = YAML.load_file("db/icon_files.yaml")
    icon_files.values.each do |arr|
      arr.each { |filename| Icon.create!(:filename => filename) }
    end

    Icon.all[0..10].each do |icon|
      Activity.create!({ :user_id => 1, :icon_id => icon.id, :label => "K #{icon.id}",
        :description => "pink #{icon.id} computer glasses." })
    end

    @ki.activities.each do |a|
      Completion.create!({ :activity_id => a.id, :date => Date.today.prev_day.prev_day }) unless a.id == 2
    end

    @ki.activities.each do |a|
      Completion.create!({ :activity_id => a.id, :date => Date.today.prev_day }) unless a.id > 8
    end

    Completion.create!({ :activity_id => 2, :date => Date.today })
    Completion.create!({ :activity_id => 5, :date => Date.today })
    Completion.create!({ :activity_id => 6, :date => Date.today })

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