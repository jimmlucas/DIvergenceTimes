# DIvergenceTimes
Determination Of Divergence Times between sub populations of _saccharomyces eubayanus_. Used Data of WGS for prepare all the workflow.
Procees of Data Anailsis Workflow :
Befor start all the workflow, you have to Downnload the runs of WGS project.

 1. First Quality control, Use "Fasqc" for know how is the quality of the runs 
 2. Trimming procees, run the scrip: quality.sh (The parametres can be change, you have to change the parametres depends of the proyect)
 3. Second Quality control, open the files that have at the end .html for know the status after the Trimming. 
 4. Mapping using a refrence genome and change the files to the format .BAM, run the scrip: bwa2 (The location of the files must be changed, use the correct local extension)
 5. Sorted and Index the files, run the scrip samtools.sh
 6. Third Quality control use samtools flagstatic or MultiQC for know: how is your file after mapping.
 7. Markduplicate(*), Before start the process of Markduplicate you have to know what is the way that you want yo use the data. In this case....
 
 *CP:check point
