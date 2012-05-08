describe 'Maturing.Models.Entry', ->
  it 'should be defined', ->
    (expect Maturing.Models.Entry).toBeDefined()

  it 'can be instantiated', ->
    entry = new Maturing.Models.Entry()
    (expect entry).not.toBeNull()

