cwlVersion: v1.0
class: Workflow

inputs:
  MinimumScore: int?
  ReferenceGenome:
    type: File
    secondaryFiles: ['.amb', '.ann', '.bwt', '.pac', '.sa']
  Fastq1: File
  Fastq2: File
  BwaOutFile: string
  AddMateTags: boolean?
  AcceptDupMarks: boolean?
  SamblasterOutFile: string

outputs:
  SamblasterOutput:
    type: File
    outputSource: samblaster/SamblasterSam

steps:
  bwa:
    run: bwa-mem.cwl
    in:
      minimumScore: MinimumScore
      reference: ReferenceGenome
      fastq1: Fastq1
      fastq2: Fastq2
      output: BwaOutFile
    out: [BwaSam]
  samblaster:
    run: samblaster.cwl
    in:
      addMateTags: AddMateTags
      acceptDupMarks: AcceptDupMarks
      input: bwa/BwaSam
      output: SamblasterOutFile
    out: [SamblasterSam]

