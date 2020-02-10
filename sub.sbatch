#!/bin/bash

#SBATCH --account=bgmp          ### SLURM account which will be charged for the job
#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=sub_test      ### Job Name
#SBATCH --time=1-00:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Node count required for the job
#SBATCH --ntasks-per-node=1     ### Nuber of tasks to be launched per Node
#SBATCH --cpus-per-task=40       ### Number of cpus (cores) per task
#SBATCH --mail-user=jsakai@uoregon.edu
#SBATCH --mail-type=ALL
#SBATCH --output=slurm-%j-%x.out

ml purge ; ml bbmap/38.16
#/home/jsakai/bgmp/crab/SequelTools/Scripts/SequelTools.sh -t Q -u subFiles.txt -c scrFiles.txt


./wtdbg2/wtdbg2 -x sq -g 7g -t 40 -i /projects/bgmp/shared/2019_Crab_PacBio_subsample/KING_samtools_subreads_75.bam -fo run1/PBK
./wtdbg2/wtpoa-cns -t 40 -i run1/pacbio_king.ctg.lay.gz -fo run1/pacbio_king.ctg.fa
