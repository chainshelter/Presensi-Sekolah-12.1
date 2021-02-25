<?php
    // TAG : 20012021.2 : Jelang Istirahat

    $SERVER = "localhost";
    $USERDB = "root";
    $KEYDB = "!!&21adi";
    $DBNAME = "db_attendance";

    $_AUTH = mysqli_connect($SERVER, $USERDB, $KEYDB, $DBNAME);

    if($_AUTH) {
        // echo "Koneksi berhasil dilakukan";
    } else {
        // echo "Koneksi gagal dilakukan";
    }
?>