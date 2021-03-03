<?php

    // 03032021.1 : API stable with authentication
    include '../../../config/connection.php';
    
    if($_SERVER['REQUEST_METHOD'] == 'POST') {
        $search_idguru = $_POST['id_guru'];
        $search_username = $_POST['username'];
        $passwordset = $_POST['password'];

        $cari_dataguru = mysqli_query($_AUTH, "SELECT COUNT(*) 'total' FROM tbl_guru WHERE id_guru = $search_idguru");
        $exec_cariguru = mysqli_fetch_assoc($cari_dataguru);

        if ($exec_cariguru['total'] == 0) {
            echo "Data guru tidak ada";
        } else {
            $cari_datauser = mysqli_query($_AUTH, "SELECT COUNT(*) 'userexist' FROM tbl_authentikasi WHERE username = '$search_username'");
            $exec_cariuser = mysqli_fetch_assoc($cari_datauser);

            if ($exec_cariuser['userexist'] == 0) {
                // echo "Username bisa untuk disimpan kedalam database";

                $newregister = mysqli_query($_AUTH, "INSERT INTO tbl_authentikasi (username, password, id_guru) VALUES ('$search_username', MD5('$passwordset'), $search_idguru)");
                
                if ($newregister) {
                    $response["message"] = "Insert data berhasil dilakukan";
                    $response["userbaru"] = array();

                    $cariuser = mysqli_query($_AUTH, "SELECT tbl_authentikasi.id_authentikasi, tbl_authentikasi.username, tbl_authentikasi.password, tbl_authentikasi.date_created 'tgl_tambahuser', tbl_guru.id_guru, tbl_guru.nip, tbl_guru.nama_guru, tbl_guru.jenis_kelamin, tbl_guru.date_created 'tgl_tambahguru' FROM tbl_authentikasi JOIN tbl_guru ON tbl_guru.id_guru=tbl_authentikasi.id_guru WHERE tbl_authentikasi.username = '$search_username'");

                    while($row = mysqli_fetch_array($cariuser)) {
                        $data = array();

                        $data['id_authentikasi'] = $row['id_authentikasi'];
                        $data['username'] = $row['username'];
                        $data['password'] = $row['password'];
                        $data['tgl_tambahuser'] = $row['tgl_tambahuser'];
                        $data['id_guru'] = $row['id_guru'];
                        $data['nip'] = $row['nip'];
                        $data['nama_guru'] = $row['nama_guru'];
                        $data['jenis_kelamin'] = $row['jenis_kelamin'];
                        $data['tgl_tambahguru'] = $row['tgl_tambahguru'];

                        array_push($response['userbaru'], $data);
                    }
                    echo json_encode($response);

                } else {
                    echo "Gagal menambahkan data";
                }
            } else {
                echo "Data username sudah tersedia di database, gunakan username yang lain";
            }
        }

        
    }

?>