require 'rails_helper'

RSpec.describe Strain, type: :model do
  it "Can't be blank ''" do
    strain = Strain.create(name: '')
    expect(strain).to be_valid
  end
  
  it "Can't be blank nil" do
    strain = Strain.create(name: nil)
    expect(strain).to be_valid
  end

  it "Can't be blank 'Carmenere'" do
    strain = Strain.create(name: 'Carmenere')
    expect(strain).to be_valid
  end
end

RSpec.describe Strain, type: :model do
  it "Can't have the same name" do
    strain1 = Strain.create(name: 'Carmenere')
    strain2 = Strain.create(name: 'Carmenere')
    
  end
  
end