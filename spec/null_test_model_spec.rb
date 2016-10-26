require "spec_helper"

RSpec.describe NullTestModel do
  it "delegates any missing class methods to the model's class it represents" do
    expect(described_class.new(1, TestModel).class.some_class_method).to eq("Hello")
    expect(described_class.new(1, AnotherTestModel).class.some_other_class_method).to eq("Heyyo")
  end

  it "has a NullClassDelegator as a class" do
    expect(described_class.new(1, TestModel).class).to be_a(NullObjectModels::NullClassDelegator)
  end
end
