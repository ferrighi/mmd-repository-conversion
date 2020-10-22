# mmd-repository-conversion
Set of scripts to convert old MMD metadata repository to new MMD specifications.

The full_old2new.sh script 
* downloads the mmd.xsd and mmdv2-to-mmdv3.xslt from the master branch of https://github.com/metno/mmd
* translate v2 mmd records to v3 mmd records
* validate v3 mmd records


The old-new.xslt is used to add ad-hoc conversions for records that do not follow v2 mmd specifications, and it 
is including the mmdv2-to-mmdv3.xslt file downloaded from full_old2new.sh

## Usage

The full_old2new.sh script is translating recursively a whole directory. It takes as input: 
* directory to be translated 
* new directory to be created
* path to the DIRECTORY of old-new.sh

Example: 

full_old2new.sh XML new_XML /home/myself/mmd-repository-coversion

