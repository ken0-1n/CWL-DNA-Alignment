cwlVersion: v1.0
class: CommandLineTool
baseCommand: [samblaster]
inputs:
  addMateTags:
    type: boolean?
    inputBinding:
      prefix: --addMateTags
      position: 1
  acceptDupMarks:
    type: boolean?
    inputBinding:
      prefix: --acceptDupMarks
      position: 2
  input:
    type: File
    inputBinding:
      prefix: -i
      position: 3
  output:
    type: string
    inputBinding:
      prefix: -o
      position: 4
outputs:
  SamblasterSam:
    type: File
    outputBinding:
      glob: $(inputs.output)

