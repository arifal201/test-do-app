class EmployeeSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :email, :nip, :hoby, :gender, :image, :image_url
end
