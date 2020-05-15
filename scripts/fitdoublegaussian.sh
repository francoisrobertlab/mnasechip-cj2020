#!/bin/bash
#SBATCH --account=def-robertf
#SBATCH --time=24:00:00
#SBATCH --array=0-0
#SBATCH --cpus-per-task=1
#SBATCH --mem=16G
#SBATCH --mail-user=christian.poitras@ircm.qc.ca
#SBATCH --mail-type=ALL
#SBATCH --output=fitdoublegaussian-%A_%a.out
#SBATCH --error=fitdoublegaussian-%A_%a.out

args=("--gaussian" "--svg" "--amin1" "0" "--amin2" "0")
args+=("$@")
if [ ! -z "$SLURM_ARRAY_TASK_ID" ]
then
  args+=("-i" "$SLURM_ARRAY_TASK_ID")
fi

mnasetools fitdoublegaussian "${args[@]}" --suffix _first_dyad
mnasetools fitdoublegaussian "${args[@]}" --suffix _first_dyad_top10
mnasetools fitdoublegaussian "${args[@]}" --suffix _first_dyad_topq1
mnasetools fitdoublegaussian "${args[@]}" --suffix _first_dyad_topq2
mnasetools fitdoublegaussian "${args[@]}" --suffix _first_dyad_topq3
mnasetools fitdoublegaussian "${args[@]}" --suffix _first_dyad_topq4
mnasetools fitdoublegaussian "${args[@]}" --suffix _first_dyad_topq5
mnasetools fitdoublegaussian "${args[@]}" --suffix _first_dyad_topmergedq
mnasetools fitdoublegaussian "${args[@]}" --suffix _second_dyad
mnasetools fitdoublegaussian "${args[@]}" --suffix _second_dyad_top10
mnasetools fitdoublegaussian "${args[@]}" --suffix _second_dyad_topq1
mnasetools fitdoublegaussian "${args[@]}" --suffix _second_dyad_topq2
mnasetools fitdoublegaussian "${args[@]}" --suffix _second_dyad_topq3
mnasetools fitdoublegaussian "${args[@]}" --suffix _second_dyad_topq4
mnasetools fitdoublegaussian "${args[@]}" --suffix _second_dyad_topq5
mnasetools fitdoublegaussian "${args[@]}" --suffix _second_dyad_topmergedq
