class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true



def self.distanciaMinima(origen, destino)
    p "ORIGEN ", origen
    p "DESTINO ", destino
    matrix = GoogleDistanceMatrix::Matrix.new

    mdestino = GoogleDistanceMatrix::Place.new address: destino
    morigen = GoogleDistanceMatrix::Place.new address: origen


    matrix.origins <<  morigen
    matrix.destinations <<   mdestino

    p matrix.origins
    p matrix.destinations
    ruta = matrix.shortest_route_by_duration_to  mdestino
    p ruta
    p ruta.distance_in_meters
   end



end
