<?php

    class Language extends CI_Controller {

    public function __construct() {
        parent::__construct();
        // Memuat helper 'url' dan 'session' jika belum di-autoload
        $this->load->helper('url');
        $this->load->library('session');
    }

    public function switch($language = "") {
        // Daftar bahasa yang Anda sediakan
        $allowed_lang = ['english', 'chinese'];

        if (in_array($language, $allowed_lang)) {
            // Simpan pilihan bahasa ke session
            $this->session->set_userdata('site_lang', $language);
        }

        // Kembalikan pengguna ke halaman terakhir yang mereka lihat
        redirect($_SERVER['HTTP_REFERER'] ?? '/');
    }
    }