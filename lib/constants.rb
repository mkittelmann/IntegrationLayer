class Constants
  CURRENT_FILE = 'nls.mrc'
  CURRENT_FORMAT = 'MARC21' ### 'UNIMARC_TAGGED'
  CURRENT_DATABASE = 'test4'
  VERSION_OF_VAL_FILE = 'MARC21.val 2014-11-27'
  WORK_DIR = 'work'
  IMPORT_FORMAT =  'json'   ### available options are 'yaml' and 'json'
  
  HASH = { 
          '001' => '001 Control Number',
          '003' => '003 Control Number Identifier',
          '005' => '005 Date and Time of Latest Transaction',
          '006' => '006 Fixed-Length Data Elements-Additional Material Characteristics',
          '007' => '007 Physical Description Fixed Field-General Information',
          '008' => '008 Fixed-Length Data Elements-General Information',
          '010' => '010 Library of Congress Control Number',
          '013' => '013 Patent Control Information',
          '015' => '015 National Bibliography Number',
          '016' => '016 National Bibliographic Agency Control Number',
          '017' => '017 Copyright or Legal Deposit Number',
          '018' => '018 Copyright Article-Fee Code',
          '020' => '020 International Standard Book Number',
          '022' => '022 International Standard Serial Number',
          '024' => '024 Other Standard Identifier',
          '025' => '025 Overseas Acquisition Number',
          '026' => '026 Fingerprint Identifier',
          '027' => '027 Standard Technical Report Number',
          '028' => '028 Publisher Number',
          '030' => '030 CODEN Designation',
          '031' => '031 Musical Incipits Information',
          '032' => '032 Postal Registration Number',
          '033' => '033 Date/Time and Place of an Event',
          '034' => '034 Coded Cartographic Mathematical Data',
          '035' => '035 System Control Number',
          '036' => '036 Original Study Number for Computer Data Files',
          '037' => '037 Source of Acquisition',
          '038' => '038 Record Content Licensor',
          '040' => '040 Cataloging Source',
          '041' => '041 Language Code',
          '042' => '042 Authentication Code',
          '043' => '043 Geographic Area Code',
          '044' => '044 Country of Publishing/Producing Entity Code',
          '045' => '045 Time Period of Content',
          '046' => '046 Special Coded Dates',
          '047' => '047 Form of Musical Composition Code',
          '048' => '048 Number of Musical Instruments or Voices Code',
          '050' => '050 Library of Congress Call Number',
          '051' => '051 Library of Congress Copy, Issue, Offprint Statement',
          '052' => '052 Geographic Classification',
          '055' => '055 Classification Numbers Assigned in Canada',
          '060' => '060 National Library of Medicine Call Number',
          '061' => '061 National Library of Medicine Copy Statement',
          '066' => '066 Character Sets Present',
          '070' => '070 National Agricultural Library Call Number',
          '071' => '071 National Agricultural Library Copy Statement',
          '072' => '072 Subject Category Code',
          '074' => '074 GPO Item Number',
          '080' => '080 Universal Decimal Classification Number',
          '082' => '082 Dewey Decimal Classification Number',
          '083' => '083 Additional Dewey Decimal Classification Number',
          '084' => '084 Other Classification Number',
          '085' => '085 Synthesized Classification Number Components',
          '086' => '086 Government Document Classification Number',
          '088' => '088 Report Number',
          '100' => '100 Main Entry-Personal Name',
          '110' => '110 Main Entry-Corporate Name',
          '111' => '111 Main Entry-Meeting Name',
          '130' => '130 Main Entry-Uniform Title',
          '210' => '210 Abbreviated Title',
          '222' => '222 Key Title',
          '240' => '240 Uniform Title',
          '242' => '242 Translation of Title by Cataloging Agency',
          '243' => '243 Collective Uniform Title',
          '245' => '245 Title Statement',
          '246' => '246 Varying Form of Title',
          '247' => '247 Former Title',
          '250' => '250 Edition Statement',
          '254' => '254 Musical Presentation Statement',
          '255' => '255 Cartographic Mathematical Data',
          '256' => '256 Computer File Characteristics',
          '258' => '258 Philatelic Issue Data',
          '260' => '260 Publication, Distribution, etc.',
          '261' => '261 Imprint Statement for Films',
          '262' => '262 Imprint Statement for Sound Recordings',
          '263' => '263 Projected Publication Date',
          '264' => '264 Production, Publication, Distribution, Manufacture, and Copyright Notice',
          '270' => '270 Address',
          '300' => '300 Physical Description',
          '306' => '306 Playing Time',
          '307' => '307 Hours, Etc.',
          '310' => '310 Current Publication Frequency',
          '321' => '321 Former Publication Frequency',
          '336' => '336 Content Type',
          '337' => '337 Media Type',
          '338' => '338 Carrier Type',
          '340' => '340 Physical Medium',
          '342' => '342 Geospatial Reference Data',
          '343' => '343 Planar Coordinate Data',
          '344' => '344 Sound Characteristics',
          '345' => '345 Projection Characteristics of Moving Image',
          '346' => '346 Video Characteristics',
          '347' => '347 Digital File Characteristics',
          '351' => '351 Organization and Arrangement of Materials',
          '352' => '352 Digital Graphic Representation',
          '355' => '355 Security Classification Control',
          '357' => '357 Originator Dissemination Control',
          '362' => '362 Dates of Publication and/or Sequential Designation',
          '363' => '363 Normalized Date and Sequential Designation',
          '365' => '365 Trade Price',
          '366' => '366 Trade Availability Information',
          '370' => '370 Associated Place',
          '377' => '377 Associated Language',
          '380' => '380 Form of Work',
          '381' => '381 Other Distinguishing Characteristics of Work or Expression',
          '382' => '382 Medium of Performance',
          '383' => '383 Numeric Designation of Musical Work',
          '384' => '384 Key',
          '385' => '385 Audience Characteristics',
          '386' => '386 Creator/Contributor Characteristics',
          '388' => '388 Time Period of Creation',
          '400' => '400 Series Statement/Added Entry-Personal Name',
          '410' => '410 Series Statement/Added Entry-Corporate Name',
          '411' => '411 Series Statement/Added Entry Meeting Name',
          '440' => '440 Series Statement/Added Entry-Title',
          '490' => '490 Series Statement',
          '500' => '500 General Note',
          '501' => '501 With Note',
          '502' => '502 Dissertation Note',
          '504' => '504 Bibliography, Etc. Note',
          '505' => '505 Formatted Contents Note',
          '506' => '506 Restrictions on Access Note',
          '507' => '507 Scale Note for Graphic Material',
          '508' => '508 Creation/Production Credits Note',
          '510' => '510 Citation/References Note',
          '511' => '511 Participant or Performer Note',
          '513' => '513 Type of Report and Period Covered Note',
          '514' => '514 Data Quality Note',
          '515' => '515 Numbering Peculiarities Note',
          '516' => '516 Type of Computer File or Data Note',
          '518' => '518 Date/Time and Place of an Event Note',
          '520' => '520 Summary, Etc.',
          '521' => '521 Target Audience Note',
          '522' => '522 Geographic Coverage Note',
          '524' => '524 Preferred Citation of Described Materials Note',
          '525' => '525 Supplement Note',
          '526' => '526 Study Program Information Note',
          '530' => '530 Additional Physical Form Available Note',
          '533' => '533 Reproduction Note',
          '534' => '534 Original Version Note',
          '535' => '535 Location of Originals/Duplicates Note',
          '536' => '536 Funding Information Note',
          '538' => '538 System Details Note',
          '540' => '540 Terms Governing Use and Reproduction Note',
          '541' => '541 Immediate Source of Acquisition Note',
          '542' => '542 Information Relating to Copyright Status',
          '544' => '544 Location of Other Archival Materials Note',
          '545' => '545 Biographical or Historical Data',
          '546' => '546 Language Note',
          '547' => '547 Former Title Complexity Note',
          '550' => '550 Issuing Body Note',
          '552' => '552 Entity and Attribute Information Note',
          '555' => '555 Cumulative Index/Finding Aids Note',
          '556' => '556 Information About Documentation Note',
          '561' => '561 Ownership and Custodial History',
          '562' => '562 Copy and Version Identification Note',
          '563' => '563 Binding Information',
          '565' => '565 Case File Characteristics Note',
          '567' => '567 Methodology Note',
          '580' => '580 Linking Entry Complexity Note',
          '581' => '581 Publications About Described Materials Note',
          '583' => '583 Action Note',
          '584' => '584 Accumulation and Frequency of Use Note',
          '585' => '585 Exhibitions Note',
          '586' => '586 Awards Note',
          '588' => '588 Source of Description Note',
          '600' => '600 Subject Added Entry-Personal Name',
          '610' => '610 Subject Added Entry-Corporate Name',
          '611' => '611 Subject Added Entry-Meeting Name',
          '630' => '630 Subject Added Entry-Uniform Title',
          '648' => '648 Subject Added Entry-Chronological Term',
          '650' => '650 Subject Added Entry-Topical Term',
          '651' => '651 Subject Added Entry-Geographic Name',
          '653' => '653 Index Term-Uncontrolled',
          '654' => '654 Subject Added Entry-Faceted Topical Terms',
          '655' => '655 Index Term-Genre/Form',
          '656' => '656 Index Term-Occupation',
          '657' => '657 Index Term-Function',
          '658' => '658 Index Term-Curriculum Objective',
          '662' => '662 Subject Added Entry-Hierarchical Place Name',
          '700' => '700 Added Entry-Personal Name',
          '710' => '710 Added Entry-Corporate Name',
          '711' => '711 Added Entry-Meeting Name',
          '720' => '720 Added Entry-Uncontrolled Name',
          '730' => '730 Added Entry-Uniform Title',
          '740' => '740 Added Entry-Uncontrolled Related/Analytical Title',
          '751' => '751 Added Entry-Geographic Name',
          '752' => '752 Added Entry-Hierarchical Place Name',
          '753' => '753 System Details Access to Computer Files',
          '754' => '754 Added Entry-Taxonomic Identification',
          '760' => '760 Main Series Entry',
          '762' => '762 Subseries Entry',
          '765' => '765 Original Language Entry',
          '767' => '767 Translation Entry',
          '770' => '770 Supplement/Special Issue Entry',
          '772' => '772 Supplement Parent Entry',
          '773' => '773 Host Item Entry',
          '774' => '774 Constituent Unit Entry',
          '775' => '775 Other Edition Entry',
          '776' => '776 Additional Physical Form Entry',
          '777' => '777 Issued With Entry',
          '780' => '780 Preceding Entry',
          '785' => '785 Succeeding Entry',
          '786' => '786 Data Source Entry',
          '787' => '787 Other Relationship Entry',
          '800' => '800 Series Added Entry-Personal Name',
          '810' => '810 Series Added Entry-Corporate Name',
          '811' => '811 Series Added Entry-Meeting Name',
          '830' => '830 Series Added Entry-Uniform Title',
          '850' => '850 Holding Institution',
          '852' => '852 Location',
          '856' => '856 Electronic Location and Access',
          '880' => '880 Alternate Graphic Representation',
          '882' => '882 Replacement Record Information',
          '883' => '883 Machine-generated Metadata Provenance',
          '886' => '886 Foreign MARC Information Field',
          '887' => '887 Non-MARC Information Field'
        }
      
  def self.get_subsection(str)
    HASH[str]
  end
  
  MESSAGES = {
    'invalid tag' => "'Locally defined field ' + v[:tag]",
    'invalid subfield' => "'Invalid or locally defined subfield ' + v[:tag] + v[:subfield]",
    'invalid subfield length' => "'Invalid lenght of subfield ' + v[:tag] + v[:subfield]",
    'invalid length' => "'Invalid lenght of field ' + v[:tag]", #?
    'missing mandatory field' => "'Missing mandatory field ' + v[:tag]",
    'missing mandatory subfield' => "'Missing mandatory subfield ' + v[:tag] + v[:subfield]",    
    'indicator 1 invalid' => "'First indicator holds an invalid value'",
    'indicator 2 invalid' => "'Second indicator holds an invalid value'", 
    'tag is not repeatable' => "'Field ' + v[:tag] + ' is not repeatable'",
    'subfield is not repeatable' => "'Subfield ' + v[:tag] + v[:subfield] + ' is not repeatable'",
    'tag is empty' => "'Field ' + v[:tag] + ' is empty'", #?
    'subfield is empty' => "'Subfield ' + v[:tag] + v[:subfield] + ' is empty'"
            }

  DESCRIPTIONS = {
    'invalid tag' => "'Locally defined field ' + v[:tag]",
    'invalid subfield' => "'Subfield ' + v[:tag] + v[:subfield] + ' is not a standard MARC21 subfield. '",
    'invalid subfield length' => "'Subfield ' + v[:tag] + v[:subfield] + ' is a fixed-length field and can only contain a predefined amount of bytes. '",
    'invalid length' => "'Field ' + v[:tag] + ' is a fixed-length field and can only contain a predefined amount of bytes. '", #?
    'missing mandatory field' => "'There are, strictly speaking, no mandatory fields or subfields in the MARC21 format. There are however a number of fields and subfields that have been defined as Minimal Level of calatoguing (http://www.loc.gov/marc/bibliographic/nlr/nlr.html). These fields and subfields contain essential information and should be present in every record.'",
    'missing mandatory subfield' => "'There are, strictly speaking, no mandatory fields or subfields in the MARC21 format. There are however a number of fields and subfields that have been defined as Minimal Level of calatoguing (http://www.loc.gov/marc/bibliographic/nlr/nlr.html). These fields and subfields contain essential information and should be present in every record.'",   
    'indicator 1 invalid' => "'The first indicator holds an invalid value.'",
    'indicator 2 invalid' => "'The second indicator holds an invalid value.'", 
    'tag is not repeatable' => "'Field ' + v[:tag] + ' is not repeatable but has been repeated. '",
    'subfield is not repeatable' => "'Subfield ' + v[:tag] + v[:subfield] + ' is not repeatable but has been repeated. '",
    'tag is empty' => "'Field ' + v[:tag] + ' is empty. '", #?
    'subfield is empty' => "'Subfield ' + v[:tag] + v[:subfield] + ' is empty. '"
            }  

  SUPPLIERTODOS = {
    'invalid tag' => "'Please review if the content of this field can be moved to a standard MARC21 field'",
    'invalid subfield' => "'Please review if the content of this subfield can be moved to a standard MARC21 subfield'",
    'invalid subfield length' => "'Please correct'",
    'invalid length' => "'Please correct'", 
    'missing mandatory field' => "'Please add the missing field to provide the minimal requirements of the MARC21 format'",
    'missing mandatory subfield' => "'Please add the missing subfield to provide the minimal requirements of the MARC21 format'",
    'indicator 1 invalid' => "'Please correct'",
    'indicator 2 invalid' => "'Please correct'",
    'tag is not repeatable' => "'Please correct'",
    'subfield is not repeatable' => "'Please correct'",
    'tag is empty' => "'Please correct'", 
    'subfield is empty' => "'Please correct'",
            }
  CONVERSIONS = {
    'invalid tag' => "'The content of this locally defined field will be ...'",
    'invalid subfield' => "'The content of this locally defined subfield will be ...'",
    'invalid subfield length' => "'The subfield will be amended to fit the required length'",
    'invalid length' => "'The field will be amended to fit the required length'", #?
    'missing mandatory field' => "'None'",
    'missing mandatory subfield' => "'None'",    
    'indicator 1 invalid' => "'None '",
    'indicator 2 invalid' => "'None '", 
    'tag is not repeatable' => "'The repeated occurrences of this field will be omitted / mapped to ...'",
    'subfield is not repeatable' => "'The repeated occurrences of this field will be concatenated'",
    'tag is empty' => "'This field will be omitted from ingest'", #?
    'subfield is empty' => "'This subfield will be omitted from ingest'"
            }       
            
    PREPROCESSING = {
    'invalid tag' => '.fcv',
    'invalid subfield' => '.fcv',
    'invalid subfield length' => '.fcv',
    'invalid length' => '.fcv',
    'missing mandatory field' => '.fcv',
    'missing mandatory subfield' => '.fcv',
    'indicator 1 invalid' => '.fcv',
    'indicator 2 invalid' => '.fcv',
    'tag is not repeatable' => '.fcv',
    'subfield is not repeatable' => '.fcv',
    'tag is empty' => '.fcv',
    'subfield is empty' => '.fcv',
            }  
end
