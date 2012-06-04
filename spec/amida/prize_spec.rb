require 'spec_helper'

describe Amida::Prize do
  context 'width == 5' do
    let(:prize) { Amida::Prize.new(5) }
    let(:correct_result) { '    !!!            ' }

    describe '#to_s' do
      context 'when prize index == 1' do
        before do
          Amida::Prize.any_instance.stub(:random_index).and_return(1)
        end

        it { prize.send(:to_s).should == correct_result }
      end
    end

    describe '#render' do
      context 'when prize index == 1' do
        before do
          prize.stub(:to_s).and_return(correct_result)
        end

        it { capture(:stdout){ prize.render }.should == correct_result + "\n" }
      end
    end
  end
end
