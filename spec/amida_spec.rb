require 'spec_helper'

describe Amida::Amida do
  context 'raise ArgumentError' do
    context 'too small width' do
      it { expect{ Amida::Amida.new(:width => 1, :height => 10) }.to raise_error ArgumentError }
    end

    context 'too small height' do
      it { expect{ Amida::Amida.new(:width => 5, :height => 0) }.to raise_error ArgumentError }
    end
  end

  context 'width, height == 5, 10' do
    describe '#render' do
      let(:amida) { Amida::Amida.new }

      after do
        to_dev_null{ amida.render }
      end

      it 'call @label.render' do
        Amida::Label.any_instance.should_receive(:render)
      end
      it 'call @route.render' do
        Amida::Route.any_instance.should_receive(:render)
      end
      it 'call @prize.render' do
        Amida::Prize.any_instance.should_receive(:render)
      end
    end
  end
end
