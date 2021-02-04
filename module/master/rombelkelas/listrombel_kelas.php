<?php

    include '../../config/connection.php';

    if($_SERVER['REQUEST_METHOD'] == 'POST') {
        // Request terpenuhi
        $kodeta = $_POST['kode_tahunajaran'];

        $cekrombel = mysqli_query($_AUTH, "SELECT COUNT(*) 'totalrombel', tbl_tahunajaran.tahunajaran FROM tbl_rombelkelas JOIN tbl_angkatan ON tbl_angkatan.kode_angkatan=tbl_rombelkelas.kode_angkatan JOIN tbl_tahunajaran ON tbl_tahunajaran.kode_tahunajaran=tbl_rombelkelas.kode_tahunajaran JOIN tbl_kelas ON tbl_kelas.kode_kelas=tbl_rombelkelas.kode_kelas JOIN tbl_jenjang ON tbl_jenjang.kode_jenjang=tbl_rombelkelas.kode_jenjang JOIN tbl_guru ON tbl_guru.id_guru=tbl_rombelkelas.id_guru WHERE tbl_rombelkelas.kode_tahunajaran = $kodeta");
        $totaldatarombel = mysqli_fetch_assoc($cekrombel);

        if ($totaldatarombel['totalrombel'] == 0) {
            $response["message"] = trim("Sory!, List data rombel kelas dengan kode tahunajaran " . $kodeta . " TIDAK terdaftar di database rombel tahun tersebut!, silahkan cari berdasarkan tahunajaran dimana rombelkelas sudah terdaftar");
            $response["code"] = 404;
            $response["status"] = false;

            echo json_encode($response);
        } else {

            $data_rombelkelas = mysqli_query($_AUTH, "SELECT kode_rombel, rombel_kelas, tbl_angkatan.kode_angkatan, tbl_angkatan.angkatan, tbl_tahunajaran.kode_tahunajaran, tbl_tahunajaran.tahunajaran, tbl_kelas.kode_kelas, tbl_kelas.kelas, tbl_jenjang.kode_jenjang, tbl_jenjang.jenjang, tbl_guru.id_guru, tbl_guru.nip, tbl_guru.nama_guru 'wali_kelas', tbl_guru.jenis_kelamin FROM tbl_rombelkelas JOIN tbl_angkatan ON tbl_angkatan.kode_angkatan=tbl_rombelkelas.kode_angkatan JOIN tbl_tahunajaran ON tbl_tahunajaran.kode_tahunajaran=tbl_rombelkelas.kode_tahunajaran JOIN tbl_kelas ON tbl_kelas.kode_kelas=tbl_rombelkelas.kode_kelas JOIN tbl_jenjang ON tbl_jenjang.kode_jenjang=tbl_rombelkelas.kode_jenjang JOIN tbl_guru ON tbl_guru.id_guru=tbl_rombelkelas.id_guru WHERE tbl_rombelkelas.kode_tahunajaran = $kodeta");

            $response = array();

            $response["message"] = trim("Horay!, List data rombel kelas dengan tahunajaran " . $totaldatarombel['tahunajaran'] . " tersedia di tahun ajaran tersebut.");
            $response["code"] = 200;
            $response["status"] = true;
            $response["totaldata"] = $totaldatarombel['totalrombel'];
            $response["listrombelkelas"] = array();

            while($row = mysqli_fetch_array($data_rombelkelas)) {
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

                array_push($response['listrombelkelas'], $data);
            }

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