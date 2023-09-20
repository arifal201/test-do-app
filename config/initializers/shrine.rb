require "shrine"
require "shrine/storage/file_system"

Shrine.plugin :activerecord
Shrine.plugin :validation
Shrine.plugin :validation_helpers
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data
Shrine.plugin :rack_file # for non-Rails apps 

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads")
}