namespace :import do

  desc "Импорт Event from spraci.com"
  task :events => :environment do
    spraci = SpraciService.new
    page = 1
    area_ids = [4]
    area_ids.each do |area_id|
      loop do
        new_elements_count = 0
        events = spraci.get_event_list(area_id, page)
        if events.blank?
          puts "no event found in N#{area_id} area" if page == 1
          break
        end

        puts "#{events.count} elements found in N#{area_id} area, page N#{page}"
        events.each do |event_hash|
          # TODO: добавить условие, что мы отбираем события не более чем через год от сегодня
          # break if event_hash[:start_date]
          puts [event_hash[:event_id], event_hash[:name]].inspect
          event = Event.find_by_event_id(event_hash[:event_id])
          if event
            puts "almost exists!"
          else
            new_elements_count += 1
            Event.create(event_hash)
          end
        end

        puts "new elements found: #{new_elements_count}"
        break if new_elements_count == 0
        page += 1
      end
      puts "page count: #{page}"
    end
  end

  desc "Импорт Area from spraci.com"
  task :areas => :environment do
    spraci = SpraciService.new
    50.upto(100) do |area_id|
      areas = spraci.get_area_list(area_id)
      if areas
        puts "#{areas.count} elements found in N#{area_id} area"
        areas.each do |area_hash|
          puts [area_hash[:area_id], area_hash[:name]].inspect
          area = Area.find_by_area_id(area_hash[:area_id])
          if area
            puts "almost exists!"
          else
            Area.create(area_hash)
          end
        end
      else
        puts "no element found in N#{area_id} area"
      end
    end
  end
end
