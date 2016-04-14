require "openc_json_schema_formats/version"
require "json_validation"
require "uri"

module OpencJsonSchemaFormats
  # From https://mathiasbynens.be/demo/url-regex
  URI_REGEX = Regexp.new("^(https?|ftp)://[^\s/$.?#].[^\s]*$", Regexp::IGNORECASE)
  class DateFormatValidator
    def validate(record)
      Date.strptime(record, '%Y-%m-%d')
      true
    rescue ArgumentError
      false
    end
  end

  class DateTimeFormatValidator
    def validate(record)
      Date.parse(record)
      true
    rescue ArgumentError
      false
    end
  end

  class NonBlankValidator
    def validate(record)
      !(record.is_a?(String) && record.strip == '')
    end
  end

  class URIValidator
    # Actually, this only checks http and https formats, so isn't
    # really for URIs
    def validate(record)
      record =~ URI_REGEX
    end
  end
end

JsonValidation.add_format_validator(
  'date', OpencJsonSchemaFormats::DateFormatValidator)

JsonValidation.add_format_validator(
  'date-time', OpencJsonSchemaFormats::DateFormatValidator)

JsonValidation.add_format_validator(
  'non-blank', OpencJsonSchemaFormats::NonBlankValidator)

JsonValidation.add_format_validator(
  'uri', OpencJsonSchemaFormats::URIValidator)
