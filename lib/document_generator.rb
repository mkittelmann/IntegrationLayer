class DocumentGenerator

  attr_reader :val, :ids, :samples, :result_gatherer

  def initialize( val )
    @val = val
  end
  
  def get_results
    @result_gatherer ||= ResultGatherer.new
    @ids ||= result_gatherer.read_identifiers  
    @samples ||= result_gatherer.read_samples
  end

  #YAML
  #'sample:' uses "yaml literal style"
  def generate_yaml_report_doc_here_doc
    get_results
    yaml = ''
    val.each do |v|
      if tag = v[:tag]
        identifiers = get_current_identifiers( v )
        sample = get_current_sample( v )
        count = identifiers ? ( identifiers.split(',').count ) : 'TODO'
        key = generate_key( v )
        yaml += <<-EOF  
---
type: report
public: 0
section: 4
subsection: #{Constants::get_subsection(tag)||'Locally Defined Fields'}
headline: #{ generate_headline( v, key )||'""' }
text: #{ generate_description_of_error( v, key )||'""' }
sample: #{"\n   |\n   " + sample.to_s.sub(/\n/,"\n   ")}
count: #{count||'""'}
records: #{identifiers||'""'}
conversion: TODO
supplierTodo: #{generate_supplierTodo( v, key )||'""'}
internTodo: TODO
comment: imported from val file, plausibility check #{v[:count]} (count in validation.rep), #{count} (count rec)
status: 2
test: #{Constants::VERSION_OF_VAL_FILE}
level: A
        EOF
        
      end
    end
    yaml
  end 
  
  def generate_yaml_report_doc
  get_results
    docs = val.each_with_object([]) do |v, arr|
      if tag = v[:tag]
        identifiers = get_current_identifiers( v )
        sample = get_current_sample( v )
        count = identifiers ? ( identifiers.split(',').count ) : 'TODO'
        key = generate_key( v )
        uuid = SecureRandom.hex(20).to_s
        hash = {   
                  '_id' => uuid ,      
                  'type' => 'report',
                  'public' => '1',
                  'section' => '4',
                  'subsection' => Constants::get_subsection(tag) || 'Locally Defined Fields' ,
                  'headline' => generate_headline( v, key )||'""'  ,
                  'text' => generate_description_of_error( v, key ) || '""' ,
                  'sample' => sample.chomp,
                  'count' => count.to_s || '""' ,
                  'records' => identifiers || '""' ,
                  'conversion' => 'TODO',
                  'supplierTodo' => generate_supplierTodo( v, key ) || '""' ,
                  'internTodo' => 'TODO',
                  'comment' => "imported from val file, plausibility check #{v[:count]} (count in validation.rep), #{count} (count rec)" ,
                  'status' => '2',
                  'test' => Constants::VERSION_OF_VAL_FILE ,
                  'level' => 'A'
                }
        arr << hash    
      end
    end
    YAML.dump docs  
  end  
  
  def generate_json_report_doc
    get_results
    docs = val.each_with_object([]) do |v, arr|
      if tag = v[:tag]
        identifiers = get_current_identifiers( v )
        sample = get_current_sample( v )
        count = identifiers ? ( identifiers.split(',').count ) : 'TODO'
        key = generate_key( v )
        uuid = SecureRandom.hex(20)
        hash = {   
                  '_id' => uuid,      
                  'type' => 'report',
                  'public' => '1',
                  'section' => '4',
                  'subsection' => Constants::get_subsection(tag) || 'Locally Defined Fields' ,
                  'headline' => generate_headline( v, key )||'""'  ,
                  'text' => generate_description_of_error( v, key ) || '""' ,
                  'sample' => sample.chomp,
                  'count' => count.to_s || '""' ,
                  'records' => identifiers || '""' ,
                  'conversion' => 'TODO',
                  'supplierTodo' => generate_supplierTodo( v, key ) || '""' ,
                  'internTodo' => 'TODO',
                  'comment' => "imported from val file, plausibility check #{v[:count]} (count in validation.rep), #{count} (count rec)" ,
                  'status' => '2',
                  'test' => Constants::VERSION_OF_VAL_FILE ,
                  'level' => 'A'
                }
        arr << hash        
      end
    end
    JSON.pretty_generate docs
  end     
  
  def write_report_doc
    format = Constants::IMPORT_FORMAT.downcase 
    abort( self.class.to_s + "Format #{format.to_s} not available." ) unless format == 'yaml' || format == 'json'
    file_name = "val2report.#{format}"
    File.open(file_name, 'w:utf-8') do |file| 
      file.write send( "generate_#{format}_report_doc" )
    end
  end
  
  private
  
  def get_current_identifiers( v )
    identifiers = ids[v[:line_number].to_s.rjust(3, '0') + '_' + v[:tag] ] || 'TODO'
    identifiers = identifiers.sub( /,\s*$/, '')
  end
  
  def get_current_sample( v )
    sample = samples[ v[:line_number].to_s.rjust(3, '0') + '_' + v[:tag] ] || 'TODO'
    sample ||= sample.to_s.sub("\n", '\n') 
    sample ||= sample.to_s.gsub('"', "'") 
  end  

  # message might vary, e.g. the count in 'invalid length: 36'
  # therefore it needs to be cut off at the colon in order to be retrievable from the list
  def generate_key( v )
    key = v[:message].match(/invalid length:/) ? v[:message].sub(/:.+/, '') : v[:message]
  end
  
  def generate_headline( v, key ) 
    eval( Constants::MESSAGES[key] ) 
  end
  
  def generate_description_of_error( v, key )
    eval( Constants::DESCRIPTIONS[key] )
  end
  
  def generate_conversion( v, key )
    eval( Constants::CONVERSIONS[key] )
  end
  
  def generate_supplierTodo( v, key )
    eval( Constants::SUPPLIERTODOS[key] )
  end 

end