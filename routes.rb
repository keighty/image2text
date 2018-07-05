require 'sinatra/base'
require "google/cloud/vision"


class Image2Text < Sinatra::Base
  project_id = "image-to-text-209313"
  # use local file
  get '/local' do
    vision = Google::Cloud::Vision.new project: project_id
    file_name = "./test-image.jpg"
    labels = vision.image(file_name).labels

    labels.map do |label|
      label.description
    end.join(' ')
  end
end
