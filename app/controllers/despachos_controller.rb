class DespachosController < ApplicationController
  before_action :setMantenedores



  def index
    @despachos = Despacho.all
  end


  def new
    @despacho = Despacho.new
    @articulosBodegas =[]
    @despacho.paquetes = []
    @despachadores = Despachador.all

    @articulos = Sell.where(:paquete_id => nil).pluck(:id)

    @bodegas = obtieneBodegas(@articulos)

    @bodegas.each do |bodega|

      Bodega.find(bodega).stocks.each do |stock|
        @articulosBodegas << {bodega: bodega, :articulos => Sell.where(:article_id => stock.article_id)}
      end

    end


    @paquete = Paquete.new

  end




  def create
    p params


    despacho = Despacho.new(despacho_params)
    origenDespacho = Location.new


#EL primer estado debe ser el de inicio
    despacho.estadodespacho = Estadodespacho.all.first

#obtenemos todos los articulos seleccionados
    ventas= params[:paquetes][:sells]
    p ventas
    ventas.delete("")
    p ventas

    ## VERIICAR LOGICA. POSIBLEMENTE HAYA QUE CAMBIAR, PRIMERO OBTENER TODA LAS BODEGAS Y LUEGO EMPEZAR A APLICAR LAS CREACIONES


    ## Realizamos copia de ventas a navegar
    copiaVentas = ventas

    bodegas = obtieneBodegas(ventas)
    p bodegas

    bodegas.each do |bodega|
      p "BODEGA : ",bodega

      arts = []
      p "A OBTENER ARTICULOS ",ventas
      p "BODEGA ",bodegas
      ventas.each do |idventa|
        p "ID ART ", idventa
        sell = Sell.find(idventa)
        if sell.article.bodegaEscogida.id == bodega.id
          p "id Escogido ",sell.article.bodegaEscogida.id
          p "Id bodega ",bodega.id
          arts << sell
        end
      end






      p "ARTICULOS SELECCIONADOS DE LA BODEGA :", arts
      paquete = Paquete.new
      paquete.estadopaquete = Estadopaquete.first
      paquete.bodega_id = bodega.id
      p "Bodega ", bodegas
      paquete.save

      arts.each do |art|
        p "ARTICULO DE BODEGA",art

        art.paquete = paquete
        art.estadoitemdespacho = Estadoitemdespacho.first

        art.save
      end
      despacho.paquetes << paquete
    end


    despacho.location = Bodega.origenDespacho.address.location
    despacho.save
    redirect_to despachos_path



  end

  def show
    @despacho = Despacho.find(params[:id])

    rutas=@despacho.rutasDespacho

    @ruta = mejorRuta(rutas)

  end






  private




  def despacho_params
    params.require(:despacho).permit(:despachador_id)
  end


  def getArticulosBodega(ventas, bodega)
    articulos = []
    p "A OBTENER ARTICULOS ",ventas
    p "BODEGA ",bodegas
    ventas.each do |idventa|
      p "ID ART ", idventa
      sell = Sell.find(idventa)
      if sell.article.bodegaEscogida.id == bodega.id
        p "id Escogido ",sell.article.bodegaEscogida.id
        p "Id bodega ",bodega.id
        articulos << sell.article
      end
    end
    p articulos
    return articulos
  end



  def obtieneBodegas(ventas)
    bodegas =[]
    ventas.each do |venta_id|
      sell = Sell.find(venta_id)
      if !bodegas.include? sell.article.bodegaEscogida
        bodegas << sell.article.bodegaEscogida
      end
    end
    return bodegas
  end


  def ordenarBodegas(bodegas)
    bodegasOrdenadas =[]

    bodegaOrigen = Bodegas.origenDespacho
    bodegasOrdenadas << bodegaOrigen

    bodegas.remove(bodegaOrigen)
    distancia = 0
    bodegas.each do |bodega|
      bodegasOrdenadas << bodega
    end

    return bodegasOrdenadas
  end


  def mejorRuta(rutas)
    p rutas
    tam = rutas[:metadata][:cantClientes]
    inicioBodegas = rutas[:origen]
    inicio = inicioBodegas

    p inicio

    rutaOptima = []
    tiempoTotal = 0
    rutaOptima << {}

    bodegaOrigen =inicio
    bodegasTotal = 0

    rutaOptima << {:tipo => "ORIGEN DESPACHO",:direccion => inicio, :tiempo => Time.at(0).utc.strftime("%H:%M:%S"), :tiempoEspera => Time.at(0).utc.strftime("%H:%M:%S")}

     p "Rutas de bodega", rutaOptima

     ultimaBodega =nil

    while rutaOptima.size <= rutas[:metadata][:cantBodegas] +1 do
        mejorTiempo = 100000000
        mejorRuta = ""
        tiempoEspera = 0
        rutas[:rutasBodega].each do |ruta|

          p "Verificando Rutas de bodega", ruta[:direccion]

          tiempoEspera = distanciaMinima(bodegaOrigen, ruta[:direccion])
          p "tiempo Estpera ", tiempoEspera
          if mejorTiempo > tiempoEspera
            p "mejor tiempo de direccion ",ruta[:direccion]
            p "rutaOptima a l momento ", rutaOptima
            mejorRuta =  ruta
            mejorTiempo = tiempoEspera

          end

      end
      tiempoTotal = tiempoTotal + tiempoEspera
      rutaOptima << {:tipo => "BODEGA", :direccion => mejorRuta[:direccion], :tiempo => Time.at(mejorTiempo).utc.strftime("%H:%M:%S"), :tiempoEspera => Time.at(tiempoTotal).utc.strftime("%H:%M:%S")}
      bodegaOrigen = mejorRuta[:direccion]

      rutas[:rutasBodega].delete(mejorRuta)
       p "Rutas de bodega", rutaOptima
       ultimaBodega = mejorRuta
     end
     dirAnterior = ultimaBodega


    p "comienza a buscar ruta de clientes"
    while rutaOptima.size <= tam or rutas[:rutasCliente].size > 0 do
        p "dentro del while"
        mejorTiempo = 100000000
        mejorRuta = dirAnterior
        rutas[:rutasCliente].each do |ruta|

          p "chequeando rutas cliente"
          p "ruta anterior: ", dirAnterior

          tiempo = distanciaMinima(dirAnterior[:direccion], ruta[:direccion])
          p "tiempo ", tiempo
          if tiempo < mejorTiempo
            p "El tiempo es mejor que el anterior"
            mejorTiempo = tiempo
            mejorRuta = ruta
            p "se guarda como la mejor ruta", mejorRuta
          end

        end

        tiempoTotal = tiempoTotal+mejorTiempo
        dirAnterior = mejorRuta
        rutaOptima << {:tipo => "CLIENTE",:direccion => mejorRuta[:direccion], :tiempo => Time.at(mejorTiempo).utc.strftime("%H:%M:%S"), :tiempoEspera => Time.at(tiempoTotal).utc.strftime("%H:%M:%S")}

        rutas[:rutasCliente].delete(mejorRuta)

    end
    tiempo = distanciaMinima(mejorRuta[:direccion], inicioBodegas)
    tiempoTotal = tiempoTotal + tiempo
    rutaOptima<< {:tipo => "RETORNO",:direccion => inicio, :tiempo => Time.at(tiempo).utc.strftime("%H:%M:%S"), :tiempoEspera => Time.at(tiempoTotal).utc.strftime("%H:%M:%S")}
    resultado = {:ruta => rutaOptima, :tiempo => Time.at(tiempoTotal).utc.strftime("%H:%M:%S")}
    return resultado
  end



  def distanciaMinima(origen, destino)
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
    p ruta.duration_in_seconds
   end


  def getArticulosBodega(ventas, bodega)
    articulos = []
    ventas.each do |venta|
      if getBodega(venta).id == bodega
        articulos << venta
      end
    end

  end


  def getBodega(sell)

    Sell.find(sell).article.tienda.bodegas.first
  end
end




