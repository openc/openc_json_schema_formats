require "openc_json_schema_formats/version"
require "json_validation"
require "uri"

module OpencJsonSchemaFormats
  class DateFormatValidator
    def validate(record)
      Date.strptime(record, '%Y-%m-%d')
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
      begin
        uri = URI.parse(record)
        uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
      rescue URI::InvalidURIError
        false
      end
    end
  end
end

JsonValidation.add_format_validator(
  'date', OpencJsonSchemaFormats::DateFormatValidator)

JsonValidation.add_format_validator(
  'non-blank', OpencJsonSchemaFormats::NonBlankValidator)

JsonValidation.add_format_validator(
  'uri', OpencJsonSchemaFormats::URIValidator)
