#v.0.5

require 'time'
require 'etc'
require 'open3'
require 'logger'
require 'securerandom'
require 'json'
require 'yaml'
require 'couchrest'

require_relative 'lib/constants.rb'
require_relative 'lib/file_chooser.rb'
require_relative 'lib/val_file_finder.rb'
require_relative 'lib/val_reader.rb'
require_relative 'lib/xml_for_conv_pl.rb'
require_relative 'lib/conv_pl_client.rb'
require_relative 'lib/falcon_params.rb'
require_relative 'lib/result_gatherer.rb'
require_relative 'lib/document_generator.rb'
require_relative 'lib/val2couch.rb'
require_relative 'lib/import_json_into_couch.rb'
require_relative 'lib/import_yaml_into_couch.rb'


### main

### complete run
# Val2Couch.new.go


### steps
v = Val2Couch.new
v.extract_identifiers
v.extract_samples
v.document_generator.write_report_doc
v.import

