# Integration Layer
Convert Falcon validation messages into Report Generator documents

###### Version
0.5

###### Purpose
This program extracts validation reports from one program (Falcon) and makes them available as reports in another program (Report Generator). 

###### Context
Data Quality Reports of Library Metadata (primarily MARC21)
Workflow Automation

###### Motivation
We have conceptualized and started working with a report generation environment that basically consists of a JQuery interface that uses CouchDB. External to this Interface we run tests (scripts, conversions, etc.) on data which generate error documents to be uploaded to CouchDB which then can be examined in the Report Generator interface to generate report modules based on a variety of predefined report drafts. 
For conversions and exploration of data we rely heavily on the tool Falcon. Among many other features, Falcon already encompasses a format validation feature. If given a format description Falcon will generate a list of reports of all instances in which this format has not been followed. Using these already existing reports would avoid a lot of redundant test writing. 

###### Starting point
This internal validation report list of Falcon is very valuable for the intended report generation, yet it is not accessible from the Report Generator as is, for several reasons:
- The Falcon validation report list exists in an internal format that is different from the report module format used by our report generating environment. 
- The references to records in the Falcon validation report list are mere internal pointer to physical record numbers. Physical record numbers, however, are subject to change. What we need instead is to replace the physical record numbers by the actual unique record identifiers. 
- The report modules of the Report Generator give a sample of the error. This feature is not yet included in the Falcon validation report list. 

###### Integration Layer
Even though the task is straightforward, the Integration Layer tool has to comprise several different modular steps. In order to avoid redundancy, these steps make use of existing sofware wherever possible. 
The Integration Layer needs to comprise the following modular steps:
- a parser for the internal format of Falcon validation report list
- a workflow to replace physical record number by record identifiers
- a workflow extracting samples for each validation error from the file
- a document generator that bundles the information from the previous steps and generates report modules in the format required by our Report Generator, using report message drafts where possible
- an upload workflow to CouchDB
Report modules can then be worked with in the Report Generator and combined with report modules that result from different workflows to a final report that will be exported as XML, converted via XSLT into LaTeX, and send to the supplier as PDF. 
The steps from parsing the internal Falcon validation report file until uploading enhanced reports in the target format can be automated. This automation will shorten the work on each file by many hours and will avoid writing redundant tests: Why write new tests for errors that are already neatly listed in an existing file?

###### Details
Above we already listed the required modular steps. The following gives details to each step and documents how they are achieved. 

**Step A: Parsing** 
Integration layer has to detect the file holding the Falcon validation report list and parse its content into a temporary data structure that can later be used to generate JSON report documents in the required target format. 
For this purpose, a cutom parser class is used. 

**Step B: Record Identifiers** 
The task of extracting record identifiers based on the given physical record numbers is relatively complex. We achieve this via a Falcon conversion. In order to facilitate debugging, there will be one conversion for each validation report in the list. 
The conversions require the following steps: 
- writing of a Falcon conversion parameter file that specifies the required conversion (i.e. extracting of record identifiers)
- running the conversion in Falcon which will create a result file that contains the record identifiers
As there are many entries in the validation report list, we need to chain these conversions using an existing workflow automation tool called conv.pl. Using conv.pl requires the generation of an xml parameter file that that tells conv.pl what to do. The whole workflow therefore consists of the following steps:
- writing a Falcon parameter file for each entry in the validation report list by a parameter generation class
- generating a conv.pl XML parameter file to run all of these conversions by another parameter generation class
- start the conv.pl workflow via a conv.pl client class

**Step C: Samples** 
The same workflow that is applied in step B is required to extract samples as well. It would be possible to extract samples in the same conversion workflow as the extraction of record identifiers, either collecting them in the same result file or letting Falcon write a second result file. In terms of performance this would be highly desirable. Yet, for the sake of clarity and debugging, the sample extraction workflow is currently implemented as separate workflow. 

**Step D: Document Generation** 
CouchDB requires JSON (or YAML) documents. The report generation environment therefore has defined a report module format in JSON (or YAML). The results of step B and C need to be integrated into this target format. 
For many parts of the resulting report, the document generator class can rely on predefined report templates currently accessible in a Constants class. 

**Step E: Upload** 
This final step is straightforward and consists merely of the upload of the generated document to CouchDB. 

###### Usage
The executable file is integration_layer.rb. The individual classes are in the lib directory. 
In this file, either the whole workflow can be started via the "go" method, or the individual steps can be performed as needed. 
The program currently requires the data file and the Falcon directory of the data file (containing among others the validation report list file Validation.rep) to sit in the same directory as integration_layer.rb. 
The name of the file used and database name used must be given in the settings file lib/Constants.rb.

###### Dependencies
The program requires the following software:
- Falcon 
- conv.pl
- CouchDB
- Reporting Tool is not required for running integration_layer.rb. However, the usefulness of the imported report documents would probably be pretty limited if the workflow doesn't proceed using Reporting Tool to integrate reports from other sources and generate the final report pdf. 

###### Development
The newest version of Falcon (falcon_20160718) offers the option to generate the initial validation report list via the command line API of Falcon. Future versions of the Integration Layer tool can therefore offer the option to auto-generate the starting file instead of triggering its generation manually in the Falcon GUI. 

###### License
GNU GPLv3 http://www.gnu.org/licenses/agpl-3.0.txt

In general, use what you want, shoot me a note if confused. 

###### Overview
![Integration Layer Workflow](img/integration_layer.png?raw=true "Integration Layer Workflow")