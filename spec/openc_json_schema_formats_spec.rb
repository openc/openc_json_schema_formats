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

  describe 'nonblank validator' do
    before do
      @validator = JsonValidation.build_validator({'format' => 'non-blank'}, strict_format_validation: true)
    end

    context 'valid objects' do
      [123, nil, "tofu"].each do |object|
        it "returns true for `#{object}`" do
          expect(@validator.validate(object)).to eq(true)
        end
      end
    end

    it "returns false for empty string" do
      expect(@validator.validate("")).to eq(false)
    end
  end

  describe 'URI validator' do
    before do
      @validator = JsonValidation.build_validator({'format' => 'uri'}, strict_format_validation: true)
    end

    context 'valid uris' do
      ["http://foo.bar/?baz=qux#quux", "https://foo.bar/?baz=qux#quux"].each do |uri|
        it "returns true for `#{uri}`" do
          expect(@validator.validate(uri)).to eq(true)
        end
      end
    end

    context 'invalid uris' do
      ["\\\\WINDOWS\\fileshare", "tofu", "http://foo.b::ar/?baz=qux#quux"].each do |uri|
        it "returns false for `#{uri}`" do
          expect(@validator.validate(uri)).to eq(false)
        end
      end
    end
  end

end
