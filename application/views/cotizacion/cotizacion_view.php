<script src="<?php echo base_url("resources/src/js/cotizacion/cotizacion.js")?>"></script>

<div class="row">

    <div class="col-md-12">
        <h1>Gestión de Cotizaciones</h1>
    </div>

    <div class="col-md-1">
        <div class="btn btn-primary" id="agregarCliente">Agregar</div>
    </div>


</div>

<div class="table-responsive">

    <table class="table table-bordered" width="100%" cellspacing="0" id="data">
        <thead style="font-weight: bold;">
        <td>Cliente</td>
        <td>Tipo de Impresión</td>
        <td>Fecha</td>
        <td>Cantidad</td>
        <td>Precio</td>
        <td>Descripción</td>
        <td>Opciones</td>
        </thead>

        <tbody>
            <tr>
                <td>Juan Carlos</td>
                <td>Pendiente</td>
                <td>10/10/2019</td>
                <td>30</td>
                <td>$45.00</td>
                <td>Pendiente</td>
                <td><button class="btn-success">Modificar</button>
                    <button class="btn-danger">Eliminar</button></td>
            </tr>
            <tr>
                <td>Rocío Chicas</td>
                <td>Pendiente</td>
                <td>11/11/2019</td>
                <td>50</td>
                <td>$70.00</td>
                <td>Pendiente</td>
                <td><button class="btn-success">Modificar</button>
                    <button class="btn-danger">Eliminar</button></td>
            </tr>
            <tr>
                <td>Francisco Edgardo</td>
                <td>Pendiente</td>
                <td>01/01/2019</td>
                <td>40</td>
                <td>$60.00</td>
                <td>Pendiente</td>
                <td><button class="btn-success">Modificar</button>
                    <button class="btn-danger">Eliminar</button></td>
            </tr>
        </tbody>

        <tfoot>
        <td>Cliente</td>
        <td>Tipo de Impresión</td>
        <td>Fecha</td>
        <td>Cantidad</td>
        <td>Precio</td>
        <td>Descripción</td>
        <td>Opciones</td>
        </tfoot>
    </table>

</div>


<!-- Modal -->
<div class="modal fade" id="frmInsertarCliente" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Insertar</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" id="formModal">
                    <div class="row">
                    <div class="form-column col-md-6">
                       <div class="form-group">
                           <label>Nombre de Cliente</label>
                           <select name="cliente" id="clienteI" class="form-control"><option>Seleccionar</option></select>
                        </div>

                        <div class="form-group">
                            <label>Fecha</label>
                            <input type="text" name="fecha" id="fechaI" class="form-control"></input>
                        </div>

                        <div class="form-group">
                            <br>
                            <a href="#" name="materiales" id="material" class="btn btn-primary btn-block">Material</a>
                        </div>
                    </div>

                    <div class="form-column col-md-6">



                         <div class="form-group">
                            <label>Tipo de Impresión</label>
                            <select name="tipoImpresion" id="tipoI" class="form-control"><option>Seleccionar</option></select>
                        </div>
                   
                        <div class="form-group">
                            <label>Descripción</label>
                            <textarea name="des" id="desI" class="form-control" autocomplete="off"></textarea>
                        </div>
                    
                        <div class="form-group">
                            <label>Estado</label>
                            <select name="estado" id="estadoI" class="form-control"><option>Seleccionar</option></select>
                        </div>
                    </div>
                    </div>
                    <button type="submit" name="btnSave" id="btnGuardar" class="btn btn-primary">Guardar Cotización</button>
                </form>
            </div>

        </div>
    </div>
</div>


<!-- Modal para mostrar el inventario -->

<div class="modal fade bd-example-modal-lg" id="modalInventario">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Inventario</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div id="mostarTabla"></div>
              <table width='100%' id='invent'>
                  <thead>
                  <th>Nombre</th>
                  <th>Stock</th>
                  <th>Precio</th>
                  <th>Descripción</th>
                  <th>Acción</th>
              </thead>
              <tbody>
                  <?php 
                    foreach($inventario as $row){
                        echo ""
                        . "<tr>"
                                . "<td>$row->nombre</td>"
                                . "<td>$row->stock</td>"
                                . "<td>$row->precio</td>"
                                . "<td>$row->descripcion</td>"
                                . "<td><a class='btn btn-success btn-block agregar' id='$row->idInventario'><i class='fas fa-plus-circle'></i> Agregar</a></td>"
                        . "</tr>";
                    }
                  ?>
              </tbody>
              <tfoot>
                <th>Nombre</th>
                <th>Stock</th>
                <th>Precio</th>
                <th>Descripción</th>
                <th>Acción</th>
                </tfoot>
            </table>
              
              
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary">Guardar</button>
      </div>
    </div>
  </div>
</div>

