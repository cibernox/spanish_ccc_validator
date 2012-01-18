require File.expand_path("./spec") + '/spec_helper.rb'

describe SpanishCccValidator do
  describe SpanishCccValidator::CustomCccValidator do
    subject{ SpanishCccValidator::CustomCccValidator }
    describe '#canonize' do
      it "cleans the string till it is just numbers" do
        subject.canonize('1234-5678-91-1245678901').should == '12345678911245678901'
        subject.canonize('Nº 1234/5678/91/1245678901').should == '12345678911245678901'
      end
    end

    describe '#calculate_digit' do
      it 'calculates que control digit for any array of 10 integers' do
        subject.calculate_digit([0,0,2,0,9,6,0,4,7,5]).should == 6
        subject.calculate_digit([0,2,0,0,0,2,4,0,7,3]).should == 0
        subject.calculate_digit([1,2,3,4,5,6,7,8,9,9]).should_not == 9
      end
    end

    describe '#validate' do
      it 'should return true it 8th digit validates bank and office and 9th digit validates account' do
        subject.validate('2096/0475/60/0200024073').should be_true
        subject.validate('296/0475/60/020002073').should be_false
        subject.validate('0002-4073-40-0200024073').should be_true
        subject.validate('0002-4073-40-0201024073').should be_false
        subject.validate('Cuenta: 00024073400200024073').should be_true
      end
    end
  end
end