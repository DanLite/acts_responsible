node 'meta' do
  @responsibility[:metadata]
end if @responsibility[:metadata].present? && @responsibility[:metadata].is_a?(Hash)

node(@responsibility[:data_key] || 'data') do
  partial @responsibility[:partial], object: @responsibility[:data]
end if @responsibility[:data] && @responsibility[:partial]

node 'errors' do
  partial 'application/error', object: @responsibility[:errors]
end if @responsibility[:errors].present?