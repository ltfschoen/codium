require 'spec_helper'

describe Membership do
 
  context "associations" do
    it { should belong_to :member }
    it { should belong_to :project }
  end

end