require "openc_json_schema_formats/version"
require "json_validation"

module OpencJsonSchemaFormats
  class DateFormatValidator
    def validate(record)
      Date.strptime(record, '%Y-%m-%d')
      true
    rescue ArgumentError
      false
    end
  end
end

JsonValidation.add_format_validator('date', OpencJsonSchemaFormats::DateFormatValidator)
