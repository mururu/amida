require 'spec_helper'

describe Amida::Label do
  context 'too big width' do
    it { expect{ Amida::Label.new(27) }.to raise_error(ArgumentError) }
  end

  context 'width is 5' do
    let(:label) { Amida::Label.new(5) }

    describe '#to_s' do
      it { label.send(:to_s).should == ' A   B   C   D   E ' }
    end

    describe '#render' do
      it { capture(:stdout){ label.render }.should == " A   B   C   D   E \n" }
    end
  end
end
