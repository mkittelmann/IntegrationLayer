
class FileChooser

  attr_reader :files, :choice

  def initialize
    @files = Val_file_finder.new.val_file_list_generator
    @choice = self.choice_maker['file'].to_i
  end
  
  def choice_suggester
    self.files.each_with_index do |file, index|
      puts index.to_s + "\t" + file     
    end
  end
  
  def choice_maker
    abort('No val file in directory.') if self.files.count == 0
    return chosen_file = { 'file' => '0' } if self.files.count == 1
    puts 'Which file?'
    self.choice_suggester
    file = gets.chomp
    if /[^0-9]/.match(base_file) || base_file.to_i >= self.files.count
      abort ('No valid index number.')
    end 
    chosen_file = { 'file' => file }
  end

  def log_writer( text )
    filename = 'cfstat.log'
    if File.exists? filename
      log_file = open(filename, 'a')
    else
      log_file = open(filename, 'w')
    end
      log_file.write text
      log_file.close
  end

end #class end