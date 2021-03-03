package ei.eseptiyadi.presensi.auth;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.widget.EditText;

import ei.eseptiyadi.presensi.R;
import ei.eseptiyadi.presensi.views.WelcomeActivity;

public class LoginActivity extends AppCompatActivity {

    EditText etPassword;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        etPassword = (EditText)findViewById(R.id.edtLogPass);

    }

    public void actionLogin(View view) {
    }

    public void goToRegister(View view) {
        startActivity(new Intent(LoginActivity.this, RegisterActivity.class));
    }
}