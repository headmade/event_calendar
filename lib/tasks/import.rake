module Savon
    class Response
      def to_xml
        @http.body.gsub /[\w\W\n]*?(<\?xml)/,'<?xml'
      end
    end
end
namespace :import do

  desc "Импорт from spraci.com"
  task :soap => :environment do
    require 'savon'
    client = Savon.client(wsdl: 'http://www.spraci.com/services/soap/index.php?wsdl')

    p client.operations
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
    response =client.call :event_list, advanced_typecasting: false, xml: "<?xml version='1.0' encoding='utf-8'?>
    <soap:Envelope xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema'>
    <soap:Body>
    <event_list xmlns='http://www.spraci.com/services/soap/'>
    <data>
    <appkey></appkey>
    <username></username>
    <password></password>
    <area>x0sydney</area>
    <tag></tag>
    <user_id></user_id>
    <user_name></user_name>
    <searchtext></searchtext>
    <page></page>
    <per_page>50</per_page>
    <type></type>
    </data>
    </event_list>
    </soap:Body>
    </soap:Envelope>"
    p response.body

  end
end
