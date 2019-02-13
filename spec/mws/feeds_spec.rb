# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Mws::Feeds do
  it "has a version number" do
    expect(Mws::Feeds::VERSION).not_to be nil
  end
end
