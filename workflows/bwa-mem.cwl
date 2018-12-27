cwlVersion: v1.0
class: CommandLineTool
baseCommand: [bwa, mem]
inputs:
  minimumScore:
    type: int?
    inputBinding:
      prefix: -T
      position: 1
  reference:
    type: File
    secondaryFiles:
        - .amb
        - .ann
        - .bwt
        - .pac
        - .sa
    inputBinding:
      position: 2
  fastq1:
    type: File
    inputBinding:
      position: 3
  fastq2:
    type: File
    inputBinding:
      position: 4
  output:
    type: string
outputs:
    BwaSam:
        type: stdout
stdout: $(inputs.output)
