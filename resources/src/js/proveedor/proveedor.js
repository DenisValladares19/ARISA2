function llenarTabla()
{
    $.ajax(
        {
            url:"Proveedor/mostrar",
            type: "POST",
            dataType: "JSON",
            success:function (data) {
                $("#dataProveedor").dataTable().fnDestroy();
                $("#dataProveedor tbody tr").remove();
                $.each(data, function (key,val) {
                    var fila ='<tr><td width="15%"><div>';
                    fila=fila + val.nombre + '</div></td><td>';
                    fila=fila + val.empresa + '</div></td><td>';
                    fila=fila + val.direccion + '</div></td><td width="10%">';
                    fila=fila + val.correo + '</div></td><td>';
                    fila=fila + val.telefono + '</div></td><td>';
                    fila=fila + val.celular + '</div></td><td width="10%">';
                    fila=fila + val.nit + '</div></td><td width="8%">';
                    fila=fila + val.dui + '</div></td><td>';
                    fila=fila + val.registroFiscal + '</td>';
                    fila = fila +  '<td> <a class="btn btn-outline-info btnEditar" id="'+val.idProveedor+'"><i class="fas fa-marker"></i></a>\n' +
                        '                     <a class="btn btn-outline-danger btnEliminar"id="'+val.idProveedor+'"><i class="far fa-trash-alt"></i></a>';
                    fila = fila + '</td></tr>';
                    $("#dataProveedor tbody").append(fila);
                });
                $("#dataProveedor").dataTable({
                    bLengthChange: false,
                    language: {
                        "decimal": "",
                        "emptyTable": "No hay información",
                        "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                        "infoEmpty": "Mostrando 0 a 0 de 0 Entradas",
                        "infoFiltered": "(Filtrado de  _MAX_  total entradas)",
                        "infoPostFix": "",
                        "thousands": ",",
                        "lengthMenu": "Mostrar _MENU_ Entradas",
                        "loadingRecords": "Cargando...",
                        "processing": "Procesando...",
                        "search": "Buscar:",
                        "zeroRecords": "Sin resultados encontrados",
                        "paginate": {
                            "first": "Primero",
                            "last": "Ultimo",
                            "next": "Siguiente",
                            "previous": "Anterior"
                        }
                    }
                });
            },
        });
}

function llenarTablaRecuperacion()
{
    $.ajax(
        {
            url:"Proveedor/mostrarEliminados",
            type: "POST",
            dataType: "JSON",
            success:function (data) {
                $("#dataProveedorRest").dataTable().fnDestroy();
                $("#dataProveedorRest tbody tr").remove();
                $.each(data, function (key,val) {
                    var fila ='<tr><td><div align="center">';
                    fila=fila + val.nombre + '</div></td><td>';
                    fila=fila + val.empresa + '</div></td><td>';
                    fila=fila + val.direccion + '</div></td><td>';
                    fila=fila + val.correo + '</div></td><td>';
                    fila=fila + val.registroFiscal + '</td>';
                    fila = fila +  '<td> <a class="btn btn-outline-info btnRest" id="'+val.idProveedor+'"><i class="fas fa-trash-restore"></i></a>';
                    fila = fila + '</td></tr>';
                    $("#dataProveedorRest tbody").append(fila);
                });
                $("#dataProveedorRest").dataTable({
                    bLengthChange: false,
                    language: {
                        "decimal": "",
                        "emptyTable": "No hay información",
                        "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                        "infoEmpty": "Mostrando 0 a 0 de 0 Entradas",
                        "infoFiltered": "(Filtrado de  _MAX_  total entradas)",
                        "infoPostFix": "",
                        "thousands": ",",
                        "lengthMenu": "Mostrar _MENU_ Entradas",
                        "loadingRecords": "Cargando...",
                        "processing": "Procesando...",
                        "search": "Buscar:",
                        "zeroRecords": "Sin resultados encontrados",
                        "paginate": {
                            "first": "Primero",
                            "last": "Ultimo",
                            "next": "Siguiente",
                            "previous": "Anterior"
                        }
                    }
                });
            },
        });
}


$(document).ready(function () {
    llenarTabla();


    $(document).on("click","#agregarProveedor",function () {
        $("#frmAgregar").modal("show");
    })

    $(document).on("click",".btnEditar",function () {

        var id= $(this).attr("id");

        $.ajax({
            url: "Proveedor/getProveedor",
            type: "post",
            data: {id: id}
        })
            .done(function (data) {

                var datos = JSON.parse(data);
                $("#idProveedor").val(datos[0].idProveedor);
                $("#txtNombreE").val(datos[0].nombre);
                $("#txtEmpresaE").val(datos[0].empresa);
                $("#txtDireccionE").val(datos[0].direccion);
                $("#txtCorreoE").val(datos[0].correo);
                $("#txtTelefonoE").val(datos[0].telefono);
                $("#txtCelularE").val(datos[0].celular);
                $("#txtNitE").val(datos[0].nit);
                $("#txtDuiE").val(datos[0].dui);
                $("#txtRegistroE").val(datos[0].registroFiscal);

            })
            .fail(function () {
                
            })
        $("#frmModicicar").modal("show");

    })



    $(document).on("click",".btnEliminar",function () {

        Swal.fire({
            title: '¿Estás seguro de Eliminar el Proveedor?',
            text: "Pueda que esta Información se Oculte de está Seccion",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Cancelar',
            confirmButtonText: 'Si, Eliminaló!'
        }).then((result) => {
            if (result.value) {

                var id= $(this).attr("id");

                $.ajax({
                    url: "Proveedor/eliminar",
                    type: "post",
                    data: {id: id}
                })

                const Toast = Swal.mixin({
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 6000,
                    timerProgressBar: true,
                    onOpen: (toast) => {
                        toast.addEventListener('mouseenter', Swal.stopTimer)
                        toast.addEventListener('mouseleave', Swal.resumeTimer)
                    }
                })

                Toast.fire({
                    icon: 'success',
                    title: 'Proveedor Eliminado con Exito'
                })
                llenarTabla();
            }
        })

    })

    $(document).on("click","#rest",function () {
        llenarTablaRecuperacion();
    })



    $(document).on("click",".btnRest",function () {
        $("#modal-13").hide();

        Swal.fire({
            title: '¿Estás seguro de Recuperar la Info. del Proveedor?',
            text: "Esta Info. se mostrará en la Tabla Principal",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Cancelar',
            confirmButtonText: 'Si, Recuperárla!'
        }).then((result) => {
            if (result.value) {

                var id= $(this).attr("id");

                $.ajax({
                    url: "Proveedor/restaurar",
                    type: "post",
                    data: {id: id}
                })

                const Toast = Swal.mixin({
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 6000,
                    timerProgressBar: true,
                    onOpen: (toast) => {
                        toast.addEventListener('mouseenter', Swal.stopTimer)
                        toast.addEventListener('mouseleave', Swal.resumeTimer)
                    }
                })

                Toast.fire({
                    icon: 'success',
                    title: 'Proveedor Recuperado con Exito'
                })
                llenarTabla();
                llenarTablaRecuperacion();
                $("#modal-13").show();
            }
            else{
                $("#modal-13").show();
            }
        })

    })




})