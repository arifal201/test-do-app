class ImageUploader < Shrine
  Attacher.validate do
    validate_max_size 1.megabytes, message: 'is too large (max is 1 MB)'
    validate_mime_type ['image/jpg','image/png']
  end
end