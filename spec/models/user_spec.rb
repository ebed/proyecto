require 'spec_helper'
require 'rails_helper'

describe User do
 it 'have an administrator' do
    u = User.joins(:profile).where(profiles: {:canadmin => true})
    expect(u.size).to be > 0
  end
end

