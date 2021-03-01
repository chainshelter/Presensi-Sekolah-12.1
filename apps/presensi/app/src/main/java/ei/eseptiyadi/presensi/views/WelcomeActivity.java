package ei.eseptiyadi.presensi.views;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import ei.eseptiyadi.presensi.R;
import ei.eseptiyadi.presensi.auth.LoginActivity;

public class WelcomeActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_welcome);
    }

    public void goToLogin(View view) {
        startActivity(new Intent(WelcomeActivity.this, LoginActivity.class));
    }
}