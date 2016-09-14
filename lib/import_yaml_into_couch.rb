# require 'couchrest'
# require 'yaml'


class ImportYAMLIntoCouch
  attr_reader :yaml
  
  def initialize
    @db = CouchRest.database("http://127.0.0.1:5984/#{Constants::CURRENT_DATABASE}")  
  end

  def import
    load_file
    response = ''
    yaml.each_with_index do |doc, ix|
      begin
        response = @db.save_doc( doc )
      rescue
        puts "Error occurred importing document #{ix}" unless response['ok']
      end
    end
  end
  
  private
  
  def load_file
    @yaml = YAML.load( File.read 'val2report.yaml', :encoding => 'utf-8'  )
  end


end