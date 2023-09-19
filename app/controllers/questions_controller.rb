class QuestionsController < ApplicationController

  def index
  end

  def question_one
    numbers = question_params[:number] || 10
    total = 1
    @result = []
    while total <= numbers do
      @result.push(convert_number(total))
      total += 1
    end
    render json: @result
  end

  def question_two
    id_start = question_params[:id_start]
    id_end = question_params[:id_end]

    years = RegistartionYear.all
    render json: years
  end

  private

  def question_params
    params.require(:question).permit(:number, :id_start, :id_end)
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
