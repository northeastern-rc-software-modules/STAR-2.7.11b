#!/bin/bash
#SBATCH -N 1
#SBATCH -n 32
#SBATCH -p short
#SBATCH -w d0004

# Setting up the environment
source env_star-2.7.11b.sh

# Creating the src directory for the installed application
mkdir -p $SOFTWARE_DIRECTORY/src

# Installing $SOFTWARE_NAME/$SOFTWARE_VERSION
# Installing STAR--2.7.11b
cd $SOFTWARE_DIRECTORY/src
wget https://github.com/alexdobin/STAR/archive/refs/tags/2.7.11b.tar.gz
tar -xvzf 2.7.11b.tar.gz
cd STAR-2.7.11b/source
make STAR 

# Manually moving files to the installation directory
mkdir -p $SOFTWARE_DIRECTORY/STAR-2.7.11b/bin
# mkdir -p $SOFTWARE_DIRECTORY/STAR-2.7.11b/lib
# mkdir -p $SOFTWARE_DIRECTORY/STAR-2.7.11b/include

# Copying binaries

cp $SOFTWARE_DIRECTORY/src/STAR-2.7.11b/source/STAR $SOFTWARE_DIRECTORY/STAR-2.7.11b/bin/
# cp -r $SOFTWARE_DIRECTORY/src/STAR-2.7.11b/source/STAR* $SOFTWARE_DIRECTORY/STAR-2.7.11b/include
# cp -r $SOFTWARE_DIRECTORY/src/STAR-2.7.11b/source/STAR* $SOFTWARE_DIRECTORY/STAR-2.7.11b/lib


# Creating modulefile
touch $SOFTWARE_VERSION
echo "#%Module" >> $SOFTWARE_VERSION
echo "module-whatis      \"Loads $SOFTWARE_NAME/$SOFTWARE_VERSION module." >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "This module was built on $(date)" >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "Spliced Transcripts Alignment to a Reference (STAR) is a fast RNA-seq read mapper, with support for splice-junction and fusion read detection" >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "The script used to build this module can be found here: $GITHUB_URL" >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "To load the module, type:" >> $SOFTWARE_VERSION
echo "module load $SOFTWARE_NAME/$SOFTWARE_VERSION" >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "\"" >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "conflict   $SOFTWARE_NAME" >> $SOFTWARE_VERSION
echo "prepend-path       PATH $SOFTWARE_DIRECTORY/star-2.7.11b/bin" >> $SOFTWARE_VERSION
echo "prepend-path       LIBRARY_PATH $SOFTWARE_DIRECTORY/star-2.7.11b/lib" >> $SOFTWARE_VERSION
echo "prepend-path       LD_LIBRARY_PATH $SOFTWARE_DIRECTORY/star-2.7.11b/lib" >> $SOFTWARE_VERSION
echo "prepend-path       CPATH $SOFTWARE_DIRECTORY/star-2.7.11b/include" >> $SOFTWARE_VERSION
# Moving modulefile
mkdir -p $CLUSTER_DIRECTORY/modulefiles/$SOFTWARE_NAME
cp $SOFTWARE_VERSION $CLUSTER_DIRECTORY/modulefiles/$SOFTWARE_NAME/$SOFTWARE_VERSION



