require 'spec_helper'

describe Amida::Label do
  context 'too big width' do
    it { expect{ Amida::Label.new(27) }.to raise_error(ArgumentError) }
  end

  context 'width is 5' do
    let(:label) { Amida::Label.new(5) }

    describe '#to_s' do
      it { label.send(:to_s).should == " \e[31mA\e[0m   \e[32mB\e[0m   \e[34mC\e[0m   \e[35mD\e[0m   \e[36mE\e[0m " }
    end

    describe '#render' do
      it { capture(:stdout){ label.render }.should == " \e[31mA\e[0m   \e[32mB\e[0m   \e[34mC\e[0m   \e[35mD\e[0m   \e[36mE\e[0m \n" }
    end
  end
end
