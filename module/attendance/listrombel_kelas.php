<?php
    // TAG : 20012021.2 : Jelang Istirahat
    // TAG : 21012021.2 : Revisi Fitur List dari Unmatched data dari Database

    include '../../config/connection.php';

    if($_SERVER['REQUEST_METHOD'] == 'POST') {
        // Request POST sudah terpenuhi
        $rombel = $_POST['kode_rombel'];
        $jurusan = $_POST['kode_jurusan'];

        // Query List Data berdasarkan Rombel Kelas
        $datasiswa_inrombel = mysqli_query($_AUTH, "SELECT tbl_rombelkelas.kode_rombel, tbl_guru.nama_guru 'wali_kelas', tbl_jenjang.jenjang, tbl_datasiswa.id_siswa, tbl_datasiswa.nis, tbl_datasiswa.nama_siswa, tbl_detailrombel.tipe_anggota, tbl_detailrombel.kode_jurusan, tbl_kelas.kode_kelas, tbl_kelas.kelas, tbl_angkatan.angkatan, tbl_tahunajaran.tahunajaran FROM tbl_detailrombel JOIN tbl_rombelkelas ON tbl_rombelkelas.kode_rombel=tbl_detailrombel.kode_rombel JOIN tbl_datasiswa ON tbl_datasiswa.id_siswa=tbl_detailrombel.id_siswa JOIN tbl_angkatan ON tbl_angkatan.kode_angkatan=tbl_rombelkelas.kode_angkatan JOIN tbl_tahunajaran ON tbl_tahunajaran.kode_tahunajaran=tbl_rombelkelas.kode_tahunajaran JOIN tbl_guru ON tbl_guru.id_guru=tbl_rombelkelas.id_guru JOIN tbl_jenjang ON tbl_jenjang.kode_jenjang=tbl_rombelkelas.kode_jenjang JOIN tbl_kelas ON tbl_kelas.kode_kelas=tbl_rombelkelas.kode_kelas JOIN tbl_jurusan ON tbl_jurusan.kode_jurusan=tbl_detailrombel.kode_jurusan WHERE tbl_rombelkelas.kode_rombel = '$rombel' AND tbl_detailrombel.kode_jurusan = '$jurusan'");
        $response = array();

        // Mengecek Total Data pada Rombel Kelas
        $count_rombel = mysqli_query($_AUTH, "SELECT COUNT(*) 'total_datasiswa' FROM tbl_detailrombel JOIN tbl_rombelkelas ON tbl_rombelkelas.kode_rombel=tbl_detailrombel.kode_rombel JOIN tbl_datasiswa ON tbl_datasiswa.id_siswa=tbl_detailrombel.id_siswa JOIN tbl_angkatan ON tbl_angkatan.kode_angkatan=tbl_rombelkelas.kode_angkatan JOIN tbl_tahunajaran ON tbl_tahunajaran.kode_tahunajaran=tbl_rombelkelas.kode_tahunajaran JOIN tbl_guru ON tbl_guru.id_guru=tbl_rombelkelas.id_guru JOIN tbl_jenjang ON tbl_jenjang.kode_jenjang=tbl_rombelkelas.kode_jenjang JOIN tbl_kelas ON tbl_kelas.kode_kelas=tbl_rombelkelas.kode_kelas JOIN tbl_jurusan ON tbl_jurusan.kode_jurusan=tbl_detailrombel.kode_jurusan WHERE tbl_rombelkelas.kode_rombel = '$rombel' AND tbl_detailrombel.kode_jurusan = '$jurusan'");
        $total_datasiswa = mysqli_fetch_assoc($count_rombel);

        if($total_datasiswa['total_datasiswa'] == 0) {

            // Data tidak tersedia
            $response["message"] = trim("Data tidak ditemukan didatabase / " . $total_datasiswa['total_datasiswa'] . " data");
            $response["code"] = 404; // Tidak ditemukan
            $response["status"] = false;
            $response["total_siswa"] = $total_datasiswa['total_datasiswa'];
            
            echo json_encode($response);
            
        } else {

            // Data tersedia di database dan akan ditampilkan ke dalam list
            $response["message"] = trim("Data ditemukan didatabase / " . $total_datasiswa['total_datasiswa'] . " data");
            $response["code"] = 200; // Data ditemukan
            $response["status"] = true;
            $response["total_siswa"] = $total_datasiswa['total_datasiswa'];
            $response["datasiswa"] = array();

            // Looping while untuk menampilkan list data siswa dalam rombel;
            // Membuat nomor urut dengan menyesuaikan data yang ada didalam database dari hasil request
            $nomorurut = 0;
            while($row = mysqli_fetch_array($datasiswa_inrombel)) {
                $nomorurut++;
                $data = array();

                $data['nomorurut_ke'] =$nomorurut;
                $data['id_siswa'] = $row['id_siswa'];
                $data["nis"] = $row['nis'];
                $data["nama_siswa"] = $row['nama_siswa'];
                $data["tipe_anggota"] = $row['tipe_anggota'];
                $data["kode_jurusan"] = $row['kode_jurusan'];

                array_push($response['datasiswa'], $data);
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