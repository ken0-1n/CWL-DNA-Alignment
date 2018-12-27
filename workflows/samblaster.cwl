cwlVersion: v1.0
class: CommandLineTool
baseCommand: [samblaster, --addMateTags, --acceptDupMarks]
inputs:
  input:
    type: File
    inputBinding:
      prefix: -i
      position: 1
  output:
    type: string
outputs:
    SamblasterSam:
        type: stdout
stdout: $(inputs.output)

