class Val_file_finder

  attr_accessor :val_file_list

  def initialize
    @val_file_list
  end

  def val_file_list_generator
    path = @path
    self.val_file_list = []
    Dir["*/Validation.rep"].each do |file|
     self.val_file_list << file.to_s
    end
    self.val_file_list
  end
  
  def each(&block)
      self.val_file_list_generator.each do |file|
        block.call file
      end
  end

end