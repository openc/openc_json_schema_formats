require 'spec_helper'

describe OpencJsonSchemaFormats do
  it 'has a version number' do
    expect(OpencJsonSchemaFormats::VERSION).not_to be nil
  end

  describe 'date format validator' do
    before do
      @validator = JsonValidation.build_validator({'format' => 'date'}, strict_format_validation: true)
    end

    context 'valid dates' do
      ['2011-01-03'].each do |date|
        it "returns true for `#{date}`" do
          expect(@validator.validate(date)).to eq(true)
        end
      end
    end

    context 'invalid dates' do
      ['2011-02-31', '06/19/1963 08:30:06 PST', 'zzz'].each do |date|
        it "returns false for `#{date}`" do
          expect(@validator.validate(date)).to eq(false)
        end
      end
    end
  end
end
