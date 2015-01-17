require 'spec_helper'

describe Jiit do 

  context 'check the database is working' do 

    it 'should create a jiit and then retrieve it from the database' do 

      expect(Jiit.count).to eq(0)
      Jiit.create(text: 'Hello World!')
      expect(Jiit.count).to eq(1)

    end
  end
end