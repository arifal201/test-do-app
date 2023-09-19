class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy]

  def index
    order_by = params[:order].present? ? params[:order] : "desc"
    @employees = if params[:nip].present?
                  Employee.filter_by_nip(params[:nip]).order(nip: order_by)
                 elsif params[:name].present?
                  Employee.filter_by_name(params[:name]).order(name: order_by)
                 else
                  Employee.all.order(created_at: order_by)
                 end
    render_success(@employees)
  end

  def create
    @employee = Employee.new(params_empolyee)
    if @employee.save
      render_success(@employee)
    else
      render_error(false, message: @employee.errors.messages)
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
      render_success(true, message: "success to destroy employee")
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
