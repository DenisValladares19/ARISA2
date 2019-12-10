<?php
/**
 * Created by PhpStorm.
 * User: ADMIN
 * Date: 22/11/2019
 * Time: 02:23 AM
 */

class Orden_Trabajar extends CI_Controller
{
    public function __construct()
    {

        parent::__construct();
        $this->load->helper("url");
    }

    public function index(){

        $data["title"] = "Orden de Trabajo";
        $this->load->view("layout/header",$data);
        $this->load->view("layout/sidebar");
        $this->load->view("layout/navbar");
        $this->load->view("orden/ordenTrabajar_view");
        $this->load->view("layout/footer");

    }
}