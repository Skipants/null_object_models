require "spec_helper"

RSpec.describe TestModel do
  describe ".null_model" do
    it "is the class with same name as the model and the prefix Null" do
      expect(TestModel.null_model).to eq(NullTestModel)
    end

    it "is NullObjectModels::Default if a Null is not defined for the class" do
      expect(TestModelWithoutNull.null_model).to eq(NullObjectModels::Default)
    end
  end

  describe ".find_or_null" do
    it "uses the model's default null model" do
      instance = create(:test_model)
      expect(described_class.find_or_null(instance.id)).to eq(instance)
    end

    it "uses a custom null model if one is passed in" do
      class SomeotherNull < NullObjectModels::Default; end
      expect(described_class.find_or_null(1, SomeotherNull)).to be_a(SomeotherNull)
    end

    describe "with one ID" do
      it "returns the instance if found" do
        instance = create(:test_model)
        expect(described_class.find_or_null(instance.id)).to eq(instance)
      end

      it "returns a null object if not found" do
        instance = described_class.find_or_null(6)
        expect(instance).to be_a(NullTestModel)
      end
    end

    describe "with multiple IDs" do
      it "returns the instances if all are found" do
        ids = create_list(:test_model, 5).map(&:id)
        instances = described_class.find_or_null(ids)

        instances.each do |instance|
          expect(instance).to be_a(described_class)
        end
      end

      it "returns null objects if none are found" do
        instances = described_class.find_or_null([17, 33, 68, 100, 171])

        instances.each do |instance|
          expect(instance).to be_a(NullTestModel)
        end
      end

      it "returns instances or null objects in the same order they were given if it is a mix" do
        (1..3).each do |id|
          create(:test_model, id: id)
        end
        instances = described_class.find_or_null([1, 33, 2, 3, 171])

        [1, 33, 2, 3, 171].each_with_index do |id, index|
          expect(instances[index].id).to eq(id)
        end

        expect(instances[0]).to be_a(described_class)
        expect(instances[1]).to be_a(NullTestModel)
        expect(instances[2]).to be_a(described_class)
        expect(instances[3]).to be_a(described_class)
        expect(instances[4]).to be_a(NullTestModel)
      end
    end
  end
end
