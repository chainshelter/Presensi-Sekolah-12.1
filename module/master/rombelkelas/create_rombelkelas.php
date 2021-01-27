<?php
    // TAG : 27012021.2 : Menamabhakan Module Menambahkan Data Rombel Kelas kedalam Database melalui API

    include '../../../config/connection.php';

    if($_SERVER['REQUEST_METHOD'] == 'POST') {
        // Berhasil mengakse API, artinya tinggal kasih sebuah action
        $cari_rombelkelas = $_POST['kode_rombel'];

        // Mencari data rombel kelas berdasarkan kode rombel kelas
        $carirombelkelas = mysqli_query($_AUTH, "SELECT COUNT(*) 'datarombelkelas' FROM tbl_rombelkelas WHERE kode_rombel = '$cari_rombelkelas'");
        $ketersediaanrombel = mysqli_fetch_assoc($carirombelkelas);

        $ketersediaanrombel['datarombelkelas'];

        if($ketersediaanrombel['datarombelkelas'] == 0) {
            // Bisa dibuat datanya
            $rombelkelas = $_POST['rombel_kelas'];
            $angkatan = $_POST['kode_angkatan'];
            $ta = $_POST['kode_tahunajaran'];
            $kelas = $_POST['kode_kelas'];
            $jenjang = $_POST['kode_jenjang'];
            $walas = $_POST['id_guru'];

            $insert_datarombelkelasbaru = mysqli_query($_AUTH, "INSERT INTO tbl_rombelkelas (kode_rombel, rombel_kelas, kode_angkatan, kode_tahunajaran, kode_kelas, kode_jenjang, id_guru) VALUES ('$cari_rombelkelas', '$rombelkelas', '$angkatan', '$ta', '$kelas', '$jenjang', '$walas');");

            if($insert_datarombelkelasbaru) {
                // Data belum tersedia di database, Memungkinkan untuk membuat data baru
                $response["message"] = trim("Data rombel kelas dengan kode rombel kelas $cari_rombelkelas berhasil ditambahkan kedalam database.");
                $response["code"] = 201;
                $response["status"] = true;
                $response["rombelbaru"] = array();

                $tampilkan_databaruditambahkan = mysqli_query($_AUTH, "SELECT kode_rombel, rombel_kelas, tbl_angkatan.kode_angkatan, tbl_angkatan.angkatan, tbl_tahunajaran.kode_tahunajaran, tbl_tahunajaran.tahunajaran, tbl_kelas.kode_kelas, tbl_kelas.kelas, tbl_jenjang.kode_jenjang, tbl_jenjang.jenjang, tbl_guru.id_guru, tbl_guru.nip, tbl_guru.nama_guru 'wali_kelas', tbl_guru.jenis_kelamin FROM tbl_rombelkelas JOIN tbl_angkatan ON tbl_angkatan.kode_angkatan=tbl_rombelkelas.kode_angkatan JOIN tbl_tahunajaran ON tbl_tahunajaran.kode_tahunajaran=tbl_rombelkelas.kode_tahunajaran JOIN tbl_kelas ON tbl_kelas.kode_kelas=tbl_rombelkelas.kode_kelas JOIN tbl_jenjang ON tbl_jenjang.kode_jenjang=tbl_rombelkelas.kode_jenjang JOIN tbl_guru ON tbl_guru.id_guru=tbl_rombelkelas.id_guru WHERE tbl_rombelkelas.kode_rombel = '$cari_rombelkelas'");

                while($row = mysqli_fetch_array($tampilkan_databaruditambahkan)) {
                    $data = array();

                    $data['kode_rombel'] = $row['kode_rombel'];
                    $data['rombel_kelas'] = $row['rombel_kelas'];
                    $data['kode_angkatan'] = $row['kode_angkatan'];
                    $data['angkatan'] = $row['angkatan'];
                    $data['kode_tahunajaran'] = $row['kode_tahunajaran'];
                    $data['kode_tahunajaranrombel'] = $row['tahunajaran'];
                    $data['kode_kelas'] = $row['kode_kelas'];
                    $data['kelas'] = $row['kelas'];
                    $data['kode_jenjang'] = $row['kode_jenjang'];
                    $data['jenjang'] = $row['jenjang'];
                    $data['id_guru'] = $row['id_guru'];
                    $data['nip'] = $row['nip'];
                    $data['wali_kelas'] = $row['wali_kelas'];
                    $data['jenis_kelamin'] = $row['jenis_kelamin'];

                    array_push($response['rombelbaru'], $data);
                }
                
                echo json_encode($response);
            }
        } else {
            // Data sudah tersedia didatabase, gunakan kode rombel yang lain
            $tampilkan_data = mysqli_query($_AUTH, "SELECT kode_rombel, rombel_kelas FROM tbl_rombelkelas WHERE kode_rombel = '$cari_rombelkelas'");
            $ambilfield = mysqli_fetch_assoc($tampilkan_data);
            $field_koderombelkelas = $ambilfield['kode_rombel'];
            $field_rombelkelas = $ambilfield['rombel_kelas'];

            $response["message"] = trim("Maaf, Rombel kelas dengan kode $field_koderombelkelas yang diinputkan sudah terdaftar didalam database dimana $field_rombelkelas");
            $response["code"] = 200; 
            $response["status"] = false;

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