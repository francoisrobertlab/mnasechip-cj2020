#!/bin/bash
#SBATCH --account=def-robertf
#SBATCH --time=24:00:00
#SBATCH --array=0-0
#SBATCH --cpus-per-task=1
#SBATCH --mem=40G
#SBATCH --mail-user=christian.poitras@ircm.qc.ca
#SBATCH --mail-type=ALL
#SBATCH --output=intersect-%A_%a.out
#SBATCH --error=intersect-%A_%a.out

args=("-a" "Top10percentTxbdGenes.txt")
args+=("$@")
if [ ! -z "$SLURM_ARRAY_TASK_ID" ]
then
  args+=("-i" "$SLURM_ARRAY_TASK_ID")
fi

seqtools intersect "${args[@]}"
