FactoryGirl.define do
  factory :event_type do
    event_type_name 'Food'
    parent 1
    image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/factories/images/myfile.jpg')))
  end
end
