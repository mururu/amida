require 'spec_helper'

describe Amida::Route do
  context 'width.height == 5,10' do
    let(:route) { Amida::Route.new(5, 10) }
    let(:correct_route) do
      [
        ' |   |   |---|   | ',
        ' |---|   |   |---| ',
        ' |   |---|   |   | ',
        ' |---|   |---|   | ',
        ' |   |---|   |---| ',
        ' |   |---|   |   | ',
        ' |---|   |   |---| ',
        ' |   |   |---|   | ',
        ' |---|   |   |---| ',
        ' |   |---|   |   | '
      ].join("\n")
    end

    context '#generate_crossbars' do
      it 'have at least 1 crossbar' do
        100.times do
          route.send(:generate_crossbars).any?{|line| line.any?{|x| x}}.should be_true
        end
      end

      it 'have no adjacent crossbars' do
        100.times do
          route.send(:generate_crossbars).any? {|line|
            line.enum_for(:any?).with_index do |x, i|
              i < line.length-1 && line[i] && line[i+1]
            end
          }.should be_false
        end
      end
    end

    describe '#to_s' do
      before do
        Amida::Route.any_instance.stub(:generate_crossbars).and_return(
           [
             [false, false, true, false],
             [true, false, false, true],
             [false, true, false, false],
             [true, false, true, false],
             [false, true, false, true],
             [false, true, false, false],
             [true, false, false, true],
             [false, false, true, false],
             [true, false, false, true],
             [false, true, false, false]
           ]
         )
      end

      it { route.send(:to_s).should == correct_route }
    end

    describe '#render' do
      before do
        route.stub(:to_s).and_return(correct_route)
      end

      it { capture(:stdout){ route.render }.should == correct_route + "\n" }
    end
  end
end
