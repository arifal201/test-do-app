class QuestionsController < ApplicationController

  def index
  end

  def question_one
    numbers = params[:number].to_i || 10
    total = 1
    @result = []
    while total <= numbers do
      @result.push(convert_number(total))
      total += 1
    end
    render_success(@result)
  end

  def question_two
    id_start = params[:id_start].to_i || 20
    id_end = params[:id_end].to_i || 100
    param_year = params[:year] || 2023
    array_ids = [id_start..id_end]

    RegistartionYear.where(id: array_ids).update_all(year: param_year)
    @result_two = RegistartionYear.all
    render_success(@result_two)
  end

  def question_three

  end

  def question_four
    
  end

  private

  def question_params
    params.require.permit(:number, :id_start, :id_end, :year)
  end

  def convert_number(value)
    if value % 6 == 0
      "DIGITAL OASIS"
    elsif value % 3 == 0
      "OS"
    elsif value % 2 == 0
      "DI"
    else
      value
    end
  end
end
