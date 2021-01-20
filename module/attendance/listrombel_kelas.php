<?php
    // TAG : 20012021.2 : Jelang Istirahat

    include '../../config/connection.php';

    if($_SERVER['REQUEST_METHOD'] == 'POST') {
        // Request POST sudah terpenuhi
        $kode_rombel = $_POST['kode_rombel'];

        // Query List Data berdasarkan Rombel Kelas
        $query_listsiswadalamrombel = "SELECT tbl_rombelkelas.kode_rombel, tbl_guru.nama_guru 'wali_kelas', tbl_jenjang.jenjang, tbl_datasiswa.id_siswa, tbl_datasiswa.nis, tbl_datasiswa.nama_siswa, tbl_detailrombel.tipe_anggota, tbl_detailrombel.kode_jurusan, tbl_kelas.kode_kelas, tbl_kelas.kelas, tbl_angkatan.angkatan, tbl_tahunajaran.tahunajaran FROM tbl_detailrombel JOIN tbl_rombelkelas ON tbl_rombelkelas.kode_rombel=tbl_detailrombel.kode_rombel JOIN tbl_datasiswa ON tbl_datasiswa.id_siswa=tbl_detailrombel.id_siswa JOIN tbl_angkatan ON tbl_angkatan.kode_angkatan=tbl_rombelkelas.kode_angkatan JOIN tbl_tahunajaran ON tbl_tahunajaran.kode_tahunajaran=tbl_rombelkelas.kode_tahunajaran JOIN tbl_guru ON tbl_guru.id_guru=tbl_rombelkelas.id_guru JOIN tbl_jenjang ON tbl_jenjang.kode_jenjang=tbl_rombelkelas.kode_jenjang JOIN tbl_kelas ON tbl_kelas.kode_kelas=tbl_rombelkelas.kode_kelas WHERE tbl_rombelkelas.kode_rombel = '$kode_rombel'";
        $execute_querylistdatarombelkelas = mysqli_query($_AUTH, $query_listsiswadalamrombel);
        $fetching_datakelas = mysqli_fetch_assoc($execute_querylistdatarombelkelas);

        // Mengecek Total Data pada Rombel Kelas
        $query_totaldata = mysqli_query($_AUTH, "SELECT COUNT(*) 'total_data' FROM tbl_detailrombel JOIN tbl_rombelkelas ON tbl_rombelkelas.kode_rombel=tbl_detailrombel.kode_rombel JOIN tbl_datasiswa ON tbl_datasiswa.id_siswa=tbl_detailrombel.id_siswa JOIN tbl_angkatan ON tbl_angkatan.kode_angkatan=tbl_rombelkelas.kode_angkatan JOIN tbl_tahunajaran ON tbl_tahunajaran.kode_tahunajaran=tbl_rombelkelas.kode_tahunajaran JOIN tbl_guru ON tbl_guru.id_guru=tbl_rombelkelas.id_guru JOIN tbl_jenjang ON tbl_jenjang.kode_jenjang=tbl_rombelkelas.kode_jenjang JOIN tbl_kelas ON tbl_kelas.kode_kelas=tbl_rombelkelas.kode_kelas WHERE tbl_rombelkelas.kode_rombel = '$kode_rombel'");
        $cekketersediaan_data = mysqli_fetch_assoc($query_totaldata);

        $result_totaldata = $cekketersediaan_data['total_data'];

        if($cekketersediaan_data['total_data'] > 0) {
            // Data tersedia di database dan akan ditampilkan ke dalam list
            $response["message"] = trim("Data tersedia didatabase total $result_totaldata");
            $response["code"] = 200;
            $response["totaldata"] = $result_totaldata;
            $response["status"] = false;
            $response["walikelas"] = $fetching_datakelas['wali_kelas'];
            $response["jenjang"] = $fetching_datakelas['jenjang'];
            $response["koderombel"] = $fetching_datakelas['kode_rombel'];
            $response["kelas"] = $fetching_datakelas['kode_kelas'] . "-" . $fetching_datakelas['kelas'];
            $response["angkatan"] = $fetching_datakelas['angkatan'];
            $response["ta"] = $fetching_datakelas['tahunajaran'];
            $response["listsiswadlmrombel"] = array();

            while($row = mysqli_fetch_array($execute_querylistdatarombelkelas)) {
                $data = array();

                $data["id_siswa"] = $row['id_siswa'];
                $data["nis"] = $row['nis'];
                $data["nama_siswa"] = $row['nama_siswa'];
                $data["tipe_anggota"] = $row['tipe_anggota'];
                $data["kode_jurusan"] = $row['kode_jurusan'];

                array_push($response['listsiswadlmrombel'], $data);
            }
            echo json_encode($response);
        } else {
            // Data tidak tersedia
            $response["message"] = trim("Data tidak tersedia didatabase total $result_totaldata");
            $response["code"] = 404;
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