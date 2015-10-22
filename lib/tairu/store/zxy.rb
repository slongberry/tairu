module Tairu
  module Store
    class ZXY
      def initialize(layer)
        @tileset = File.join(File.expand_path(Tairu.layers[layer]['location']), Tairu.layers[layer]['tileset'])
      end

      def get(coord, format='png')
        z = "#{coord.zoom}"
        x = "#{coord.column}"
        y = "#{coord.row}"

        path = File.join(@tileset, z, x, y)

        return nil unless File.exists?(path)

        data = File.open(path, 'r') do |f|
          begin
            f.flock(File::LOCK_SH)
            f.read
          ensure
            f.flock(File::LOCK_UN)
          end
        end

        mime_type = "image/#{format}"
        tile = data.nil? ? nil : Tairu::Tile.new(data, mime_type)
        tile
      end
    end
  end
end
