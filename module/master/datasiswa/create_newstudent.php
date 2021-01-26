<?php
    // TAG : 26012021.2 : Menamabhakan Module Menambahkan Data Siswa kedalam Database melalui API

    include '../../../config/connection.php';

    if($_SERVER['REQUEST_METHOD'] == 'POST') {
        // Berhasil mengakse API, artinya tinggal kasih sebuah action
        $carinis = $_POST['nis'];

        // Mencari data siswa berdasarkan NIS
        $cari_datasiswa = mysqli_query($_AUTH, "SELECT COUNT(*) 'ketersediaan_data' FROM tbl_datasiswa WHERE nis = '$carinis'");
        $ketersediaansiswa = mysqli_fetch_assoc($cari_datasiswa);

        $ketersediaansiswa['ketersediaan_data'];

        if($ketersediaansiswa['ketersediaan_data'] == 0) {
            // Bisa dibuat datanya
            $namasiswa_baru = $_POST['nama_siswa'];
            $jssiswa_baru = $_POST['jenis_kelamin'];

            $insert_datasiswabaru = mysqli_query($_AUTH, "INSERT INTO tbl_datasiswa (nis, nama_siswa, jenis_kelamin) VALUES ('$carinis', '$namasiswa_baru', '$jssiswa_baru')");

            if($insert_datasiswabaru) {
                // Data belum tersedia di database, Memungkinkan untuk membuat data baru
                $response["message"] = trim("Data siswa dengan NIS $carinis berhasil ditambahkan kedalam database.");
                $response["code"] = 201;
                $response["status"] = true;
                $response["availablity"] = "Posible";
                $response["ketersediaan_data"] = $ketersediaansiswa['ketersediaan_data'];
                $response["datasiswa"] = array();

                $tampilkan_datasiswaterbaru = mysqli_query($_AUTH, "SELECT id_siswa, nis, nama_siswa, jenis_kelamin, date_created FROM tbl_datasiswa WHERE nis = '$carinis'");

                while($row = mysqli_fetch_array($tampilkan_datasiswaterbaru)) {
                    $data = array();

                    $data['id_siswa'] = $row['id_siswa'];
                    $data["nis"] = $row['nis'];
                    $data["nama_siswa"] = $row['nama_siswa'];
                $response["availablity"] = "Posible";
                    $data["jenis_kelamin"] = $row['jenis_kelamin'];
                    $data["date_created"] = $row['date_created'];

                    array_push($response['datasiswa'], $data);
                }
                
                echo json_encode($response);
            }
        } else {
            // Data sudah tersedia didatabase, gunakan NIS yang lain
            // Data sudah tersedia di database
            $tampilkan_data = mysqli_query($_AUTH, "SELECT id_siswa, nis, nama_siswa, jenis_kelamin, date_created FROM tbl_datasiswa WHERE nis = '$carinis'");
            $ambilfield = mysqli_fetch_assoc($tampilkan_data);
            $field_namasiswa = $ambilfield['nama_siswa'];

            $response["message"] = trim("Maaf, NIS $carinis yang diinputkan merupakan pemilik dari Saudara/i / Andanda/i $field_namasiswa, Gunakan NIS yang lain!");
            $response["code"] = 200; // Tidak ditemukan
            $response["status"] = false;
            $response["availablity"] = "Imposible";
            $response["ketersediaan_data"] = $ketersediaansiswa['ketersediaan_data'];


            echo json_encode($response);
        }

    } else {
        // Request POST belum terpenuhi
        $response["message"] = trim("Oops! Sory, Request API ini membutuhkan parameter!.");
        $response["code"] = 400;
        $response["status"] = false;

        echo json_encode($response);
    }
?>