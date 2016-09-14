class XML_for_conv_pl   
  
  def self.write_xml_file(records_or_samples = 'records', filename = 'new.xml', type = 'FalconConvert', input_file = Constants::CURRENT_FILE )
    File.open(filename, 'w:utf-8') do |file| 
      file.write("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n")
      file.write("<conversion>\n")
      file.write( self.write_info )
      file.write("\t<workflow>\n")
      file.write( self.write_modules( records_or_samples ) )
      file.write("\t</workflow>\n")
      file.write("</conversion>\n")
    end
  end
  
  private
  
  def self.write_modules( records_or_samples )
    modules = ''
    index = 0
    input_file = Constants::CURRENT_FILE
    selected_files = ( records_or_samples == 'samples' ) ? "./#{ Constants::WORK_DIR }/*_sample.fcv" : "./#{ Constants::WORK_DIR }/*[^e].fcv"
    Dir.glob( selected_files ) do |fcv|
      return_arr = write_module( 'FalconConvert', fcv, index, input_file )
      modules += return_arr[0]
      input_file = return_arr[1]
      index += 1
    end
    modules
  end
  
  #writes individual modules
  def self.write_module(type = 'FalconConvert', filename, index, input_file )
    #setup
    filename = filename.sub("./#{ Constants::WORK_DIR }/", '')
    input_file = Constants::CURRENT_FILE
    file_format = Constants::CURRENT_FORMAT
    output_file = filename.sub('.fcv', '') + '.flc'
    #common xml
    xml_module = "\t\t<module name=\"#{type}\">\n"
    xml_module += "\t\t\t<note></note>\n"
    #different
    case type
      when 'FalconConvert'
        xml_module += "\t\t\t<with-param name=\"input\" value=\"#{input_file}\"/>\n"
        xml_module += "\t\t\t<with-param name=\"script\" value=\"{$p}/#{filename}\"/>\n"
        xml_module += "\t\t\t<with-param name=\"output\" value=\"#{output_file}\"/>\n"
        xml_module += "\t\t\t<with-param name=\"format\" value=\"#{file_format}\"/>\n"  
      end
    xml_module += "\t\t</module>\n\n"
    [ xml_module, output_file ]
  end

  #writes info block of xml file
  def self.write_info
    info = "\t<info>\n"
    info += "\t\t<name></name>\n"
    info += "\t\t<description></description>\n"
    info += "\t\t<version>YYYY-MM-DD</version>\n"
    info += "\t\t<author></author>\n"
    info += "\t</info>\n"
    info
  end
end
