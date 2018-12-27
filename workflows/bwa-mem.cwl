cwlVersion: v1.0
class: CommandLineTool
baseCommand: [bwa, mem]
inputs:
  reference:
    type: File
    secondaryFiles:
        - .amb
        - .ann
        - .bwt
        - .pac
        - .sa
    inputBinding:
      position: 1
  fastq1:
    type: File
    inputBinding:
      position: 2
  fastq2:
    type: File
    inputBinding:
      position: 3
  output:
    type: string
outputs:
    BwaSam:
        type: stdout
stdout: $(inputs.output)
