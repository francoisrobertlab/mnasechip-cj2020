#!/bin/bash
#SBATCH --account=def-robertf
#SBATCH --time=24:00:00
#SBATCH --array=0-0
#SBATCH --cpus-per-task=1
#SBATCH --mem=60G
#SBATCH --mail-user=christian.poitras@ircm.qc.ca
#SBATCH --mail-type=ALL
#SBATCH --output=split-dyad-%A_%a.out
#SBATCH --error=split-dyad-%A_%a.out

args=("--binLength" "11")
args+=("$@")
if [ ! -z "$SLURM_ARRAY_TASK_ID" ]
then
  args+=("-i" "$SLURM_ARRAY_TASK_ID")
fi

seqtools slowsplit --binMinLength 63 --binMaxLength 73 "${args[@]}"
seqtools slowsplit --binMinLength 85 --binMaxLength 95 "${args[@]}"
seqtools slowsplit --binMinLength 98 --binMaxLength 108 "${args[@]}"
seqtools slowsplit --binMinLength 120 --binMaxLength 130 "${args[@]}"
