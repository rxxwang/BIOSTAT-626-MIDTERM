#!/bin/sh

#SBATCH --job-name=Binary_SVM
#SBATCH --time=30:00:00
#SBATCH --mail-user=rxxwang@umich.edu
#SBATCH --mail-type=END,FAIL
#SBATCH --mem=4g
#SBATCH --cpus-per-task=12

R CMD BATCH --no-save --no-restore Binary_SVM.R