#!/bin/bash
#SBATCH --account=def-robertf
#SBATCH --time=24:00:00
#SBATCH --array=0-0
#SBATCH --cpus-per-task=1
#SBATCH --mem=16G
#SBATCH --mail-user=christian.poitras@ircm.qc.ca
#SBATCH --mail-type=ALL
#SBATCH --output=fitgaussian-%A_%a.out
#SBATCH --error=fitgaussian-%A_%a.out

args=("--svg" "--amin" "0")
args+=("$@")
if [ ! -z "$SLURM_ARRAY_TASK_ID" ]
then
  args+=("-i" "$SLURM_ARRAY_TASK_ID")
fi

mnasetools fitgaussian "${args[@]}" --suffix _first_dyad
mnasetools fitgaussian "${args[@]}" --suffix _first_dyad_top10
mnasetools fitgaussian "${args[@]}" --suffix _first_dyad_topq1
mnasetools fitgaussian "${args[@]}" --suffix _first_dyad_topq2
mnasetools fitgaussian "${args[@]}" --suffix _first_dyad_topq3
mnasetools fitgaussian "${args[@]}" --suffix _first_dyad_topq4
mnasetools fitgaussian "${args[@]}" --suffix _first_dyad_topq5
mnasetools fitgaussian "${args[@]}" --suffix _first_dyad_topmergedq
mnasetools fitgaussian "${args[@]}" --suffix _second_dyad
mnasetools fitgaussian "${args[@]}" --suffix _second_dyad_top10
mnasetools fitgaussian "${args[@]}" --suffix _second_dyad_topq1
mnasetools fitgaussian "${args[@]}" --suffix _second_dyad_topq2
mnasetools fitgaussian "${args[@]}" --suffix _second_dyad_topq3
mnasetools fitgaussian "${args[@]}" --suffix _second_dyad_topq4
mnasetools fitgaussian "${args[@]}" --suffix _second_dyad_topq5
mnasetools fitgaussian "${args[@]}" --suffix _second_dyad_topmergedq
