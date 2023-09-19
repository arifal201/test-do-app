class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy]

  def index
    @employees = Employee.all
    render_success(@employees)
  end

  def create
    @employee = Employee.new(params_empolyee)
    if @employee.save
      render_success(@employee)
    else
      render_error(@employee)
    end
  end

  def update
    if @employee.update(params_empolyee)
      render_success(@employee)
    else
      render_error(@employee)
    end
  end

  def show
    render_success(@employee)
  end

  def destroy
    if @employee.destroy
      render_success(nil, message: "success to destroy employee")
    else
      render_error(@employee, message: @employee.errors.messages)
    end
  end

  private

  def params_empolyee
    params.require(:employee).permit(:nip, :email, :gender, :name, :hoby)
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end
end
