class FalconParams
  
  attr_reader :val, :work_dir

  def initialize( val, work_dir = 'work' )
    @work_dir = work_dir
    make_work_dir( work_dir )
    @val = val
  end
  
  def make_work_dir( dir )
    Dir.mkdir("./#{dir}") unless File.exists?("./#{dir}") 
  end
  
  def write_fcv_file  #expects MARC21 format!
    val.each do |v|
      if v[:tag]
        fcv = <<-EOF  
#nr +A *a Z
#+#
#-A
#001 b4 P", "
#+#
**a
"#{v[:records].gsub(',',"\"\r\n\"")}"
*         
        EOF
        File.open( "./#{work_dir}/" + v[:line_number].to_s.rjust(3, '0') + '_' + v[:tag] + '.fcv', 'w') do |file|
          file.write fcv
        end
      end
    end
    0
  end
 
  def write_fcv_file_to_get_sample
    val.each do |v|
      if v[:tag]
        fcv = <<-EOF  
#nr +A *a Z
#+#
#-A
#001 b4 #{'P"\013\010"'}
##{v[:tag] + ' ++ ' + '>a' }
#+#

#(a
#cc #{'P"\013\010"'}
#)a

**a
"#{v[:records].gsub(/^([^,]+),.+$/,'\1')}"
*               
        EOF
        File.open("./#{work_dir}/" + v[:line_number].to_s.rjust(3, '0') + '_' + v[:tag] + '_sample.fcv', 'w') do |file|
          file.write fcv
        end
      end
    end
    0
  end 
  
  #not necessary when system call, left for convenience, unused
  def write_bat( xml_file_name )
    File.open('conv.bat', 'w') do |file|
      file.write 'C:\local_work\converter\conv.pl -s ./data -w . -i #{xml_file_name} -p' + " #{Dir.pwd} -dv"
    end
  end


end