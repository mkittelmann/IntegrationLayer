# require 'couchrest'
# require 'json'

class ImportJSONIntoCouch
  attr_reader :json
  
  def initialize
    @db = CouchRest.database("http://127.0.0.1:5984/#{Constants::CURRENT_DATABASE}")  
  end

  def import
    load_file
    response = ''
    json.each_with_index do |doc, ix|
      begin
        response = @db.save_doc( doc )
      rescue
        puts "Error occurred importing document #{ix}" unless response['ok']
      end
    end
  end
  
  private
  
  def load_file
    @json = JSON.parse( File.read 'val2report.json', :encoding => 'utf-8'  )
  end
end