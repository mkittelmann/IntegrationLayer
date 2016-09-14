class ConvPlClient
  include Open3  

  def run_conv_pl( xml, work_dir = Constants::WORK_DIR )
    Dir.mkdir("./#{work_dir}") unless File.exists?("./#{work_dir}") 
    File.delete( "./#{work_dir}/isrunning.lock" ) if File.exist? "./#{work_dir}/isrunning.lock" 
    
    ##run external script
    ##list of commands that work
    #double quotes or backtics require to escape the backslashes
    #perl needs to be added even though in PATH
    
    ##ALSO WORKS:
    # exec('perl C:\local_work\converter\conv.pl -s ./data -w ./#{work_dir} -i #{xml} -p C:\local_work\val2fart -dv')
    
    ##ALSO WORKS:
    # r = `perl C:\\local_work\\converter\\conv.pl -s ./data -w ./#{work_dir} -i #{xml} -p C:\\local_work\\val2fart -dv`
    # puts r
    
    ##ALSO WORKS:
    # system 'perl C:\local_work\converter\conv.pl -s ./data -w ./#{work_dir} -i #{xml} -p C:\local_work\val2fart -dv'
    
    ##ALSO WORKS:
    system "perl C:\\local_work\\converter\\conv.pl -s ./data -w ./#{work_dir} -i #{xml} -p #{Dir.pwd + '/' + Constants::WORK_DIR} -dv"
    puts $?.exitstatus
    
    ##ALSO WORKS:
    # stdin, stdout, stderr, wait_thr = Open3.popen3("perl C:\local_work\converter\conv.pl -s ./data -w ./#{work_dir} -i #{xml} -p #{Dir.pwd} -dv") { |stdin, stdout, stderr, wait_thr| puts exit_status = wait_thr[:pid].value }
  end

end