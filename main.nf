#!/usr/bin/env nextflow

param.inCsvFile="./test.csv"

sampleChannel = channel
  .fromPath("${param.inCsvFile}", type: "file")
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