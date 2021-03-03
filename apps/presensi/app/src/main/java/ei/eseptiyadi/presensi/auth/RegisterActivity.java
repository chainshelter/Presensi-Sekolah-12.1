package ei.eseptiyadi.presensi.auth;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import ei.eseptiyadi.presensi.R;

public class RegisterActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
    }

    public void loginNow(View view) {
        startActivity(new Intent(RegisterActivity.this, LoginActivity.class));
    }

    public void actionRegister(View view) {
    }
}