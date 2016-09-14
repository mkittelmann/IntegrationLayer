class ResultGatherer

  #read file resulting from conversion
  def read_identifiers
    ids = Dir.glob("./#{Constants::WORK_DIR}/*[^e].flc").each_with_object( {} ) do |flc, ids|
      file_content = File.readlines(flc) 
      identifiers = file_content ? file_content[0] : ''
      tag = flc.sub('.flc', '').sub("./#{Constants::WORK_DIR}/", '')
      ids[ tag ] = identifiers    
    end
  end
       
  #read file resulting from conversion
  def read_samples
    Dir.glob("./#{Constants::WORK_DIR}/*_sample.flc").each_with_object( {} ) do |flc, samples|
      file_content = File.readlines(flc) 
      if file_content[1]
        s = file_content ? file_content[0] + file_content[1] : ''
        s = s.gsub(/#{31.chr}/, '$')
      else
        s = ''
      end
      tag = flc.sub('_sample.flc', '').sub("./#{Constants::WORK_DIR}/", '')
      samples[ tag ] = s
    end
  end
  
end