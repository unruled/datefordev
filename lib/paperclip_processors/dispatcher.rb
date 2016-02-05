module Paperclip

  class BaseProcessor < Processor

    def initialize file, options={}, attachment=nil
      super
      $resource = @resource = attachment.instance
    end

    def temp_file basename, extension, data=nil
      t = Tempfile.new [basename, extension]
      t.binmode
      t.write data if data.present?
      t.rewind
      t
    end

    def from_file
      File.expand_path(@file.path)
    end

    def to_file destination
      File.expand_path(destination.path)
    end
  end

  class Dispatcher < BaseProcessor

    def make
      @from_extension = File.extname(from_file) 
      @from_basename = File.basename(from_file, @from_extension)

      spec = @resource.resource_spec
      width  = ""
      height = ""
      background = ""

      temp = temp_file @from_basename, ".png"

      command = "convert #{from_file} -thumbnail #{width}x#{height} -background #{background} -flatten -auto-orient #{to_file(temp)}"

      Paperclip.run(command)

      temp
    end

  end

end

