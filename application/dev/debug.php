<? 

 class Debug {
    // Buat function test untuk insert langsung
public function test_insert()
{
    // Test data hardcode
    $test_data = array(
        'username'  => 'TEST123',
        'password'  => md5('12345678'),
        'level'     => 'User'
    );
    
    echo "<h3>Testing Direct Insert</h3>";
    echo "<p>Test Data:</p>";
    echo "<pre>";
    print_r($test_data);
    echo "</pre>";
    
    // Cek struktur tabel user
    echo "<h3>Struktur Tabel User:</h3>";
    $fields = $this->db->field_data('user');
    foreach($fields as $field) {
        echo "Field: " . $field->name . " | Type: " . $field->type . " | Max Length: " . $field->max_length . " | Null: " . ($field->null ? 'YES' : 'NO') . " | Default: " . $field->default . "<br>";
    }
    
    // Test insert
    $result = $this->db->insert('user', $test_data);
    
    if ($result) {
        echo "<p style='color:green;'>SUCCESS: Test insert berhasil!</p>";
        echo "<p>Insert ID: " . $this->db->insert_id() . "</p>";
    } else {
        echo "<p style='color:red;'>ERROR: Test insert gagal!</p>";
        $error = $this->db->error();
        echo "<p>Error: " . $error['message'] . "</p>";
        echo "<p>Query: " . $this->db->last_query() . "</p>";
    }
    
    // Cleanup - hapus test data
    $this->db->delete('user', array('username' => 'TEST123'));
    
    echo "<p>Test data cleaned up.</p>";
}

// Buat juga function untuk cek database
public function check_database()
{
    echo "<h3>Database Check</h3>";
    
    // Cek tabel user ada atau tidak
    if ($this->db->table_exists('user')) {
        echo "<p style='color:green;'>Tabel 'user' ada</p>";
        
        // Tampilkan struktur
        echo "<h4>Struktur Tabel User:</h4>";
        $fields = $this->db->field_data('user');
        echo "<table border='1'>";
        echo "<tr><th>Field</th><th>Type</th><th>Length</th><th>Null</th><th>Key</th><th>Default</th></tr>";
        foreach($fields as $field) {
            echo "<tr>";
            echo "<td>" . $field->name . "</td>";
            echo "<td>" . $field->type . "</td>";
            echo "<td>" . $field->max_length . "</td>";
            echo "<td>" . ($field->null ? 'YES' : 'NO') . "</td>";
            echo "<td>" . $field->key . "</td>";
            echo "<td>" . $field->default . "</td>";
            echo "</tr>";
        }
        echo "</table>";
        
        // Cek data user yang ada
        $users = $this->db->get('user')->result();
        echo "<h4>Data User Existing (" . count($users) . " records):</h4>";
        if (count($users) > 0) {
            echo "<pre>";
            print_r($users);
            echo "</pre>";
        } else {
            echo "<p>Tidak ada data user</p>";
        }
        
    } else {
        echo "<p style='color:red;'>Tabel 'user' tidak ada!</p>";
    }
    
    // Cek tabel pegawai
    if ($this->db->table_exists('pegawai')) {
        echo "<p style='color:green;'>Tabel 'pegawai' ada</p>";
        
        // Sample data pegawai
        $pegawai = $this->db->limit(3)->get('pegawai')->result();
        echo "<h4>Sample Data Pegawai:</h4>";
        echo "<pre>";
        print_r($pegawai);
        echo "</pre>";
    } else {
        echo "<p style='color:red;'>Tabel 'pegawai' tidak ada!</p>";
    }
}
 }