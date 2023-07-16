# DivergenceTimes
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![license-shield]][license-url]

NextFlow pipeline for Determination of divergence times between subpopulations of saccharomyces eubayanus. Used the Bioinfotmatics tools for data from WGS

Develop to automate analysis of the WGS-Eukaryotic. Using DB by University of Chile.

If you want, you can use you own date too, or compare with anather workflow. Everything is automated so it will be easy to run.

## Process:

* Quality control
* Trimming methods
* Mapping
* Data collection and quality assesment
* Data matrix construction
* Phylogenomic matrix
* Maximum likelihood phylogenetic analyses

# How to use it?

## Requirements

Before starting the entire workflow, you need to have installed all the tools:

* Qualimap
* Trimmomatic
* GATK
* BWA
* Samtools
* IQ-TREE

## Preparation of inputs

You can start with your own Dates or used DB.
. If you plan to use DB, you need to download the WGS project runs.

 1. First quality control, "Fasqc" was used to know how the quality of the print runs is.
 2. Clipping process, run the script: quality.sh (The parameters can be changed, you have to change the parameters depending on the project)
 3. Second Quality Control (visual control), open the files that have .html at the end to know the status after the Cut.
 4. Map using a reference genome and change the file format to .BAM format, run the script: bwa2 (The location of the files must be changed, use the correct local extension)
 5. Sort and index the files, run the samtools.sh script
 6. Third QC, use samtools flagstatic or MultiQC to know: how is your file after mapping.
 7. Markduplicate(*), before starting the Markduplicate process you must know how you want to use the data. In this case used picard's.Its importan know the ID used.
 8.  
 
 *CP:check point

[contributors-shield]: https://img.shields.io/github/contributors/jimmlucas/DIvergenceTimes.svg?style=for-the-badge
[contributors-url]: https://github.com/jimmlucas/DIvergenceTimes/graphs/contributors

[forks-shield]: https://img.shields.io/github/forks/jimmlucas/DIvergenceTimes.svg?style=for-the-badge
[forks-url]: https://github.com/jimmlucas/DIvergenceTimes/network/members

[stars-shield]: https://img.shields.io/github/stars/jimmlucas/DIvergenceTimes.svg?style=for-the-badge
[stars-url]: https://github.com/gjimmlucas/DIvergenceTimes/stargazers

[issues-shield]: https://img.shields.io/github/issues/jimmlucas/DIvergenceTimes.svg?style=for-the-badge
[issues-url]: https://github.com/jimmlucas/DIvergenceTimes/issues

[license-shield]: https://img.shields.io/github/license/jimmlucas/DIvergenceTimes.svg?style=for-the-badge
[license-url]: https://github.com/jimmlucas/DIvergenceTimes/blob/master/LICENSE.txt
