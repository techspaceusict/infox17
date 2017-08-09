class ApiController < ActionController::API

  def response_data(data, message, status, error: nil, disabled: false, update: false, params: {})
    result = Hash.new
    result[:data]  = data
    result[:message] = message
    result[:status] = status
    result[:error] = error
    result[:disabled] = disabled
    result[:update] = update
    render json: result, params: params, status: status
  end
end