class FloorplanUploader < BaseUploader
  process convert: 'png'

  # Create different versions of your uploaded files:
  version :large do
    process resize_to_fill: [2000, 2000]
  end

  version :thumb do
    process resize_to_fill: [100, 100]
  end

  def filename
    'plan.png' if original_filename
  end
end
