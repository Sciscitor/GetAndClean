README
========================================================

This repo contains files required for course project for Getting and Cleaning Data. Apart from the README file, there are two other files.

run_analysis.R
-------------------------------------------------------

This file can be run to carry out the end-to-end sequence of steps required to create tidy data set as described in the code book.  The activities it carries out are:

1. Download the data and upload it into datasets
2. Assemble our pieces of data into a single set, with 
good labelling.  
3. Only keep columns that have "mean" or "std" within them
4. Aggregate the data to keep only the average values for each 
Subject / Activity pairing
5. Write out our data to a file for submission

CodeBook.md
-----------------------------------------------------

This file contains a descriptor of the data and variables used for this project and references the original study.
