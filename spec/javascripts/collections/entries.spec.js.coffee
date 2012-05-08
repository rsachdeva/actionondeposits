describe 'Maturing.Collections.Entries', ->
  it 'should be defined', ->
    (expect Maturing.Collections.Entries).toBeDefined()

  it 'can be instantiated', ->
    entries = new Maturing.Collections.Entries()
    (expect entries).not.toBeNull()