require "spec_helper"

RSpec.describe NullTestModel do
  it "delegates any missing class methods to the model's class it represents" do
    expect(described_class.new(1, TestModel).class.some_class_method).to eq("Hello")
  end
end
