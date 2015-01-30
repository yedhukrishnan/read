require 'rails_helper'

RSpec.describe Category, :type => :model do

  subject{ Category.new }

  it { is_expected.to have_many :articles }
  
end
