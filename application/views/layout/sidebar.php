
    <!-- Nav lateral -->
    <section class="full-box nav-lateral">
        <div class="full-box nav-lateral-bg show-nav-lateral"></div>
        <div class="full-box nav-lateral-content">
            <figure class="full-box nav-lateral-avatar">
                <i class="far fa-times-circle show-nav-lateral"></i>
                <img src="<?php echo base_url()?>resources/images/uploads/<?php echo $this->session->userdata("image")?>")?>" class="img-fluid" alt="Avatar">
                <figcaption class="roboto-medium text-center">
                    <?php echo $this->session->userdata("nombre");?> <br><small class="roboto-condensed-light">  <?php echo $this->session->userdata("rol");?></small>
                </figcaption>
            </figure>
            <div class="full-box nav-lateral-bar"></div>
            <nav class="full-box nav-lateral-menu">
                <ul>
                    <li>
                        <a href="#"><i class="fab fa-dashcube fa-fw"></i> &nbsp; Dashboard</a>
                    </li>

                    <li>
                        <a href="Cliente"><i class="fas fa-users fa-fw"></i> &nbsp; Clientes</a>

                    </li>

                    <!-- Proveedor -->
                    <li>
                        <a href="Proveedor"><i class="fas fa-store-alt fa-fw"></i> Proveedores</a>

                    </li>

                    <!-- Inventario -->
                    <li>
                        <a href="Inventario"><i class="fas fa-clipboard-list fa-fw"></i> Inventario</a>
                    </li>

                    <li>
                        <a href="#" class="nav-btn-submenu"><i class="fas fa-file-invoice-dollar fa-fw"></i> &nbsp; Orden de Trabajo <i class="fas fa-chevron-down"></i></a>
                        <ul>
                            <li>
                                <a href="Orden"><i class="fas fa-plus fa-fw"></i> &nbsp; Nueva Orden de Trabajo</a>
                            </li>
                            <li>
                                <a href="Lista_Orden"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; Lista de Ordenes de Trabajo</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="Cotizacion"><i class="fas  fa-user-secret fa-fw"></i> &nbsp; Cotizaciones</a>
                    </li>

                    <li>
                        <a href="#" class="nav-btn-submenu"><i class="fas fa-users fa-fw"></i> &nbsp; Usuarios <i class="fas fa-chevron-down"></i></a>
                        <ul>
                            <li>
                                <a href="Rol"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp Rol</a>
                            </li>
                            <li>
                                <a href="Usuario"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; Lista de Usuario</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="Muestra"><i class="fas  fa-user-secret fa-fw"></i> &nbsp; Muestra</a>
                    </li>
                </ul>
            </nav>
        </div>
    </section>