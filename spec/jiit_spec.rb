require 'spec_helper'

describe Jiit do 

  context 'check can add jiit to database' do 

    it 'should be created and then retrieved from the db' do 

      expect(Jiit.count).to eq(0)
      Jiit.create(text: 'Hello World!')
      expect(Jiit.count).to eq(1)
      
    end
  end
end