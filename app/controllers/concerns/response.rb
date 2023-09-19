module Response
  def render_success(data, **optional)
    render json: {data: data, status: :ok, **optional}
  end

  def render_error(data, **optional)
    render json: {data: data, status: :bad_request, **optional}
  end
end