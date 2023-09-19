class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
    render json: @employees
  end

  def create
    @employee = Employee.new(params_empolyee)
    if @employee.save
      render json: @employee
    else
      render json: @employee.errors.messages
    end
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def params_empolyee
    params.require(:employee).permit(:nip, :email, :gender, :name, :hoby)
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end
end
