#!/usr/bin/env nextflow

params.inCsvFile="./test.csv"

sampleChannel = channel
  .fromPath("${params.inCsvFile}", type: "file")
  .splitCsv(header: true)
  .map{ row -> tuple(row.id, row.name) }

process bob {
  
  input:
      tuple sampleId, sampleName from sampleChannel

  script:
"""
echo "id= ${sampleId}, name=${sampleName}"
"""

}