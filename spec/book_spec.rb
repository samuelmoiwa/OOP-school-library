require_relative '../book'

describe Book do
  context 'when input passed to the instance book' do
    book = Book.new 'benardo', 'bello'
    it 'expect title to be benardo' do
      expect(book.title).to eql 'benardo'
    end

    it 'edxpect author to be bello' do
      expect(book.author).to eql 'bello'
    end
  end
end
