<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MY_Controller extends CI_Controller {

    public function __construct() {
        parent::__construct();

        // Cek session untuk bahasa yang dipilih pengguna
        $site_lang = $this->session->userdata('site_lang');

        // Jika ada bahasa di session, gunakan itu. Jika tidak, pakai default dari config.
        if ($site_lang) {
            $this->config->set_item('language', $site_lang);
        } else {
            // Jika tidak ada session, pastikan kita pakai bahasa default dari config
            $this->config->set_item('language', $this->config->item('language'));
        }

        // Muat file bahasa utama 'helpdesk_lang.php' untuk seluruh aplikasi
        $this->lang->load('helpdesk', $this->config->item('language'));
    }
}