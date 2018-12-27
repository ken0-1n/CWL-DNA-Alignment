cwlVersion: v1.0
class: Workflow

inputs:
  ReferenceGenome:
    type: File
    secondaryFiles: ['.amb', '.ann', '.bwt', '.pac', '.sa']
  Fastq1: File
  Fastq2: File
  BwaOutFile: string
  SamblasterOutFile: string

outputs:
  SamblasterOutput:
    type: File
    outputSource: samblaster/SamblasterSam

steps:
  bwa:
    run: bwa-mem.cwl
    in:
      reference: ReferenceGenome
      fastq1: Fastq1
      fastq2: Fastq2
      output: BwaOutFile
    out: [BwaSam]
  samblaster:
    run: samblaster.cwl
    in:
      input: bwa/BwaSam
      output: SamblasterOutFile
    out: [SamblasterSam]

