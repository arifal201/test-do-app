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
    return render_error(false, message: "please insert 2 words for chek anagram") unless params[:anagram].present?
    array_words = params[:anagram].split(" ")
    word1 = array_words[0]
    word2 = array_words[1]
    @result_three = {
      word1: word1,
      word2: word2,
      is_anagram: word1.chars.sort == word2.chars.sort
    }
    render_success(@result_three)
  end

  def question_four
    return render_error(false, message: "please insert numbers for check separator") unless params[:numbers].present?
    numbers = params[:numbers]
    number = numbers.delete(".")
    number_digit = number.chars
    number_size = number_digit.size
    @result_four = []
    number_digit.each_with_index do |digit, index|
      factor = 10 ** (number_size - index - 1)
      @result_four.push(digit.to_i * factor)
    end
    render_success(@result_four)
  end

  private

  def question_params
    params.require.permit(:number, :id_start, :id_end, :year, :anagram)
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
