require 'store/mbtiles'
require 'store/esri'
require 'store/tms'
require 'store/geojson'
require 'store/zxy'

module Tairu
  module Store
    TYPES = {
      'mbtiles' => Tairu::Store::MBTiles,
      'esri' => Tairu::Store::Esri,
      'tms' => Tairu::Store::TMS,
      'json' => Tairu::Store::GeoJSON,
      'zxy' => Tairu::Store::ZXY
    }
  end
end
