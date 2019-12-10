<?php
/**
 * Created by PhpStorm.
 * User: ADMIN
 * Date: 22/11/2019
 * Time: 01:31 AM
 */

class Orden extends CI_Controller
{
    public function __construct()
    {

        parent::__construct();
        $this->load->helper("url");
    }

    public function index(){


        $this->load->view("layout/header");
        $this->load->view("layout/sidebar");
        $this->load->view("layout/navbar");
        $this->load->view("orden/orden_view");
        $this->load->view("layout/footer");

    }

}