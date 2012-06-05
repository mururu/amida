# coding: utf-8
require 'spec_helper'

describe Amida do
  describe 'Amida.namu' do
    it do
      aa = <<-AA
　 ／￣￣￣＼
　｜　　　　｜
　｜　　　　｜　＿
　｜　 ^　 ^ ) ///ﾄ､
　(　 >ﾉ(＿)Y ////)|
　∧丶i-=ニ=|｜　｜|
／＼＼＼ ￣ノ｜　ﾉノ
／　＼＼ ￣　/　/ |
      AA

      capture(:stdout){ Amida.namu }.should == aa
    end
  end
end
