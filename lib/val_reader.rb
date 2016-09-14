class ValReader

  attr_reader :path_and_file, :contents

  def initialize(path_and_file)
    @path_and_file = path_and_file
    @contents = File.readlines(path_and_file)
  end
  
  def read_val
    val_regex = /^([^ ]+) *(\$*[^ ]*) +([0-9]+)( {4})(.+)\t([0-9,]+)$/
    val_arr = contents.each_with_object( [] ).with_index  do |( line, arr ), line_number|
      if line.match( val_regex )
        tag, subfield, count, message, records = ( line.gsub!(val_regex, '\1::\2::\3::\5::\6').chomp.split('::') || line ) unless ( line.match(/^(tag|-)/) || !line )
        arr << { :tag => tag, :subfield => subfield, :count => count, :message => message, :records => records, :line_number => line_number }   
      end
    end
  end

end  