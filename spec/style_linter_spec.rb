require_relative '../lib/linter'
require_relative '../lib/style_linter'

describe Stylint do

  let(:checker) { Stylint.new('../Assets/bad_styles.css')}

  describe '#comment check method' do
    context 'when there is comment' do
      it 'checks if there is comments on the line' do
        contain = checker.send(:comment_check, '/*', 5)
        expect(contain).not_to eq(['Remove comments on line 5'])
      end
    end
  end

  describe '#space check method' do
    context 'when there is two spaces before main content line' do
      it 'checks for two spaces at beginning of line' do
        contain = checker.send(:space_check, ' ', 13)
        expect(contain).not_to eq(['Two spaces needed at the start of line 13'])
      end
    end
  end

  describe '#unit check method' do
    context 'when rem or em used instead of pixels' do
      it 'checks for other measurement unit besides px' do
        contain = checker.send(:unit_check, 'rem', 21)
        expect(contain).not_to eq(['Recommended use of rem or em for responsiveness on line 21'])
      end
    end
  end

  describe '#start space check method' do
    context 'when no space before line' do
      it 'checks for a closing curly brace at end of line' do
        contain = checker.send(:start_space_check, '}', 12)
        expect(contain).not_to eq(['Remove empty space at start of line 12'])
      end

      it 'checks for a period symbol at start of line' do
        contain = checker.send(:start_space_check, '.', 3)
        expect(contain).not_to eq(['Remove empty space at start of line 3'])
      end
    end
  end

  describe '#colon space check method' do
    context 'when no space after colon' do
      it 'checks for spaces after :' do
        contain = checker.send(:colon_space_check, ' ', 27)
        expect(contain).not_to eq(['Extra space needed after colon on line 27'])
      end
    end
  end

  describe '#start bracket check method' do
    context 'when there is two spaces' do
      it 'checks for two spaces before { ' do
        contain = checker.send(:start_bracket_check, '{', 26)
        expect(contain).not_to eq(['Expected { at the end of line 26. Any more code should fall on next line.'])
      end
    end
  end

  describe '#end bracket check method' do
    context 'when there is no text after closing bracket' do
      it 'checks for no space nor text after closing bracket' do
        contain = checker.send(:end_bracket_check, '}', 26)
        expect(contain).not_to eq(['Expected } at the end of line 26'])
      end
    end
  end

  describe '#trailing space check method' do
    it 'checks for trailing spaces on line' do
      contain = checker.send(:empty_space_check, ' ', 8)
      expect(contain).not_to eq(['Remove trailing spaces at end of line 8'])
    end
  end
end