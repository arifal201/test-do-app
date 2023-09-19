module Response
  def render_success(data, **optional)
    render json: {data: data, status: :ok, **optional}, status: :ok
  end

  def render_error(data, **optional)
    render json: {data: data, status: :bad_request, **optional}, status: :bad_request
  end
end