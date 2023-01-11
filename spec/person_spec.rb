require_relative '../person'
describe Person do
  context 'when an instance created and parameter passed' do
    person = Person.new(29, 'mankush')
    it 'expect age to be 29' do
      expect(person.age).to eql 29
    end
    it 'expect name to be mankush' do
      expect(person.name).to eql 'mankush'
    end
  end
end
