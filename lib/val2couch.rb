class Val2Couch
  include Open3  

  attr_reader :val, :file, :document_generator, :conv_pl_client, :falcon_params

  def initialize
    fc = FileChooser.new
    @file = fc.files[fc.choice]
    @val = ValReader.new( file ).read_val
    @falcon_params = FalconParams.new( val )
    @conv_pl_client = ConvPlClient.new
    @document_generator = DocumentGenerator.new( val )
  end
  
  # complete run
  def go
    extract_identifiers
    extract_samples
    document_generator.write_report_doc( Constants::IMPORT_FORMAT.downcase )  
    import
  end
  
  # steps
  
  def extract_identifiers
    falcon_params.write_fcv_file
    XML_for_conv_pl.write_xml_file( 'records', 'records.xml' )
    conv_pl_client.run_conv_pl( 'records.xml' )
  end
  
  def extract_samples
    falcon_params.write_fcv_file_to_get_sample
    XML_for_conv_pl.write_xml_file( 'samples', 'samples.xml' )
    conv_pl_client.run_conv_pl( 'samples.xml' )
  end

  def import
    @importer = Object.const_get( "Import#{ Constants::IMPORT_FORMAT.upcase }IntoCouch" ).new
    @importer.import
  end
  
end 