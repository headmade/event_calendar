module Savon
    class Response
      def to_xml
        @http.body.gsub /[\w\W\n]*?(<\?xml)/,'<?xml'
      end
    end
end

require 'savon'
class SpraciService < BaseService

  attr_accessor :client

  def initialize(wsdl = 'http://www.spraci.com/services/soap/index.php?wsdl')
    @client = Savon.client(wsdl: wsdl)
  end

  def get_area_list(area = "")
    response = client.call :event_list, advanced_typecasting: false, xml: area_request_xml(area)
    items = response.body[:area_list_response][:return][:item] if response.body[:area_list_response][:return].present?
    if items
      items = [items] unless items.is_a?(Array)
      items.each do |item|
        self.class.prepare_area_attributes(item)
      end
    end
    items
  end

  def get_event_list(area, page)
    response = client.call :event_list, advanced_typecasting: false, xml: event_request_xml(area, page)
    items = response.body[:event_list_response][:return][:item] if response.body[:event_list_response][:return].present?
    if items
      items = [items] unless items.is_a?(Array)
      items.each do |item|
        self.class.prepare_event_attributes(item)
      end
    end
    items
  end

  # когда area не указан, он берет материки, части света, в общем,
  # крупные образования. Чтобы спуститься глубже, надо задать в поле area родительский ID
  # причем указывать
  def area_request_xml(area = "")
    "<soapenv:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:soap='http://www.spraci.com/services/soap/'>
       <soapenv:Header/>
       <soapenv:Body>
          <soap:area_list soapenv:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/'>
             <data xsi:type='soap:AreaFetch'>
                <!--You may enter the following 5 items in any order-->
                <appkey xsi:type='xsd:string'></appkey>
                <username xsi:type='xsd:string'></username>
                <password xsi:type='xsd:string'></password>
                <area xsi:type='xsd:string'>#{area}</area>
                <name xsi:type='xsd:string'></name>
             </data>
          </soap:area_list>
       </soapenv:Body>
    </soapenv:Envelope>"
  end

  def event_request_xml(area, page = "")
    "<?xml version='1.0' encoding='utf-8'?>
    <soap:Envelope xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema'>
    <soap:Body>
    <event_list xmlns='http://www.spraci.com/services/soap/'>
    <data>
    <appkey></appkey>
    <username></username>
    <password></password>
    <area>#{area}</area>
    <tag></tag>
    <user_id></user_id>
    <user_name></user_name>
    <searchtext></searchtext>
    <page>#{page}</page>
    <per_page></per_page>
    <type></type>
    </data>
    </event_list>
    </soap:Body>
    </soap:Envelope>"
  end

  def self.prepare_event_attributes(hash)
    hash.each do |key, value|
      hash.delete(key) unless configus.event_attributes.include?(key)
      hash[key] = nil if value == {:"@xsi:type"=>"xsd:string"}
    end
  end

  def self.prepare_area_attributes(hash)
    hash.each do |key, value|
      hash.delete(key) unless configus.area_attributes.include?(key)
      hash[key] = nil if value == {:"@xsi:type"=>"xsd:string"}
    end
  end

end