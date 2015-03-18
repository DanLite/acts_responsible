module ActsResponsible
  module Core

    def render_response(data, data_key, template, options={})
      prefix = self.responsible_config[:prefix]

      @responsibility ||= {}
      @responsibility.merge!({
        data_key: data_key,
        data: data,
        metadata: options.delete(:meta),
        partial: "#{prefix}/#{template}"
      })

      options.merge!(template: 'acts_responsible/response')
      render options
    end

    def render_empty_response(options={})
      render_response(nil, nil, nil, options)
    end

    def render_error(status, errors=[], options={})
      @responsibility ||= {}
      response_errors = []

      if errors.is_a? ActiveModel::Errors
        errors.keys.each do |field|
          errors.full_messages_for(field).each do |message|
            response_errors << {field: field, detail: message}
          end
        end
      else
        response_errors = Array.wrap(errors)
      end

      @responsibility[:errors] = response_errors

      options[:status] = status
      render_empty_response options
    end

  end
end