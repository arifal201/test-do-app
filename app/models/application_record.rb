class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  private

  def record_not_found
    redirect_to action: :index
  end
end
