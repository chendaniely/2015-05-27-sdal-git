#!/usr/bin/env bash

# don't overwrite files.
set -o noclobber

# Exit if no arguments were provided.
[ $# -eq 0 ] && { echo "Usage: $0 [target directory]"; exit 1; }

# the first argument passed into the script should be the dir
# where you want the folder structure setup

echo "Setting up folder structure in $1"

# if directory does not exist, create it
if [ ! -d "$1" ]; then
    mkdir $1
fi

cd $1
mkdir doc data code results present reports scratch

WD=$(pwd)

cd $WD
cd doc
echo "Doc directory with one subdirectory per manuscript" > README.md
mkdir project meetings lit proposal
cd project
echo "Project description and the admin docs; include project_name_description.txt" > README.md
echo "This should be a project description" >> README.md
cd ../meetings
echo "Meeting notes" > README.md
cd ../lit
echo "Reference materials" README.md
cd ../proposal
mkdir solicit examples figures drafts
touch staff.txt budget.txt
echo "the research solicitation (e.g. RFP, RFI) and related material" > solicit/README.md
echo "other successful proposal" > examples/README.md
echo "figures" > figures/README.md
echo "drafts" > drafts/README.md

cd $WD
cd data
echo "Data directory for storing fixed data sets" > README.md
mkdir 1_original 2_working 3_tidy 4_clean
echo "originally received data stored as read-only/nonvolatile" > 1_original/README.md
echo "intermediate data that can be regenerated and should not be tracked" > 2_working/README.md
echo "original data that has been tranformed to 3rd Normal Form (e.g. tidyR) format" > 3_tidy/README.md
echo "data that has been cleaned and transformed for specific analysis" > 4_clean/README.md

cd $WD
cd code
mkdir $USER
cd $USER
mkdir R PY SAS HACKS
echo "user scripts" > README.md

cd $WD
echo "user intermediate results in the form of YYYYMMDD_NAME_VER.TYPE" > results/README.md

cd $WD
echo "presentations" > present/README.md

cd $WD
echo "reports" > reports/README.md

cd $WD
echo "temporary files that can be safely deleted or lost" > scratch/README.md

echo "Folders created."

cd $WD

cat > README.md << EOF
