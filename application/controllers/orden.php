<?php
/**
 * Description of orden
 *
 * @author Admin
 */
include (APPPATH."controllers/Padre_Desing.php");
class orden extends Padre_Desing {
    
    public function __construct() {
        parent::__construct();
        $this->load->helper("url");
    }
    
    public function index(){
        $datos["data"] = array("Orden de Trabajo");
        $this->load->view("layout/header");
        $this->load->view("layout/sidebar");
        $this->load->view("layout/navbar",$datos);
        $this->load->view("orden/orden_view");
        $this->load->view("layout/footer");
        
    }
}
