namespace :import do

  desc "Импорт from spraci.com"
  task :events => :environment do
    spraci = SpraciService.new
    p spraci.client.operations
    #response = client.call :event_list, message: {
      #appkey: '',
      #username: '',
      #type:'',
      #tag:'',
      #user_id:'',
      #venue_id:'',
      #user_name:'',
      #searchtext:'',
      #page:'',
      #per_page:'',
      #area: 'x0x0'}
    response = spraci.get_event_list(1, 1)
    p response.body

  end

  desc "Импорт всех Area"
  task :areas => :environment do
    spraci = SpraciService.new
    50.upto(100) do |area_id|
      areas = spraci.get_area_list(area_id)
      if areas
        puts "#{areas.count} elements found in N#{area_id} area"
        areas.each do |area_hash|
          puts [area_hash[:area_id], area_hash[:name]].inspect
          area = Area.find_by_area_id(area_hash[:area_id])
          if area.present?
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
