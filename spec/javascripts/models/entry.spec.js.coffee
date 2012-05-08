
describe 'Raffler.Models.Entry', ->
  it 'should be defined', ->
    (expect Raffler.Models.Entry).toBeDefined()

  it 'can be instantiated', ->
    entry = new Raffler.Models.Entry()
    (expect entry).not.toBeNull()

