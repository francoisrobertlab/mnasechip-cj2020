#!/bin/bash
#SBATCH --account=def-robertf
#SBATCH --array=0-0
#SBATCH --cpus-per-task=1
#SBATCH --mem=16G
#SBATCH --mail-user=christian.poitras@ircm.qc.ca
#SBATCH --mail-type=ALL
#SBATCH --output=dyadcoverage-%A_%a.out
#SBATCH --error=dyadcoverage-%A_%a.out

args=("--smoothing" "20")
args+=("$@")
if [ ! -z "$SLURM_ARRAY_TASK_ID" ]
then
  args+=("-i" "$SLURM_ARRAY_TASK_ID")
fi

mnasetools dyadcov "${args[@]}" -g first_dyad.txt --suffix _first_dyad
mnasetools dyadcov "${args[@]}" -g first_dyad.txt --selection top10.txt --suffix _first_dyad_top10
mnasetools dyadcov "${args[@]}" -g first_dyad.txt --selection top-q1.txt --suffix _first_dyad_topq1
mnasetools dyadcov "${args[@]}" -g first_dyad.txt --selection top-q2.txt --suffix _first_dyad_topq2
mnasetools dyadcov "${args[@]}" -g first_dyad.txt --selection top-q3.txt --suffix _first_dyad_topq3
mnasetools dyadcov "${args[@]}" -g first_dyad.txt --selection top-q4.txt --suffix _first_dyad_topq4
mnasetools dyadcov "${args[@]}" -g first_dyad.txt --selection top-q5.txt --suffix _first_dyad_topq5
mnasetools dyadcov "${args[@]}" -g first_dyad.txt --selection top-merged-q.txt --suffix _first_dyad_topmergedq
mnasetools dyadcov "${args[@]}" -g second_dyad.txt --suffix _second_dyad
mnasetools dyadcov "${args[@]}" -g second_dyad.txt --selection top10.txt --suffix _second_dyad_top10
mnasetools dyadcov "${args[@]}" -g second_dyad.txt --selection top-q1.txt --suffix _second_dyad_topq1
mnasetools dyadcov "${args[@]}" -g second_dyad.txt --selection top-q2.txt --suffix _second_dyad_topq2
mnasetools dyadcov "${args[@]}" -g second_dyad.txt --selection top-q3.txt --suffix _second_dyad_topq3
mnasetools dyadcov "${args[@]}" -g second_dyad.txt --selection top-q4.txt --suffix _second_dyad_topq4
mnasetools dyadcov "${args[@]}" -g second_dyad.txt --selection top-q5.txt --suffix _second_dyad_topq5
mnasetools dyadcov "${args[@]}" -g second_dyad.txt --selection top-merged-q.txt --suffix _second_dyad_topmergedq
