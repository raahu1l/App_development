package com.example.counter_app;

import android.os.Bundle;
import android.widget.TextView;
import com.google.android.material.button.MaterialButton;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    private int counter = 0;
    private TextView counterText;
    private MaterialButton incrementButton, decrementButton, resetButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        counterText = findViewById(R.id.counterText);
        incrementButton = findViewById(R.id.incrementButton);
        decrementButton = findViewById(R.id.decrementButton);
        resetButton = findViewById(R.id.resetButton);

        incrementButton.setOnClickListener(view -> {
            counter++;
            updateCounterText();
        });

        decrementButton.setOnClickListener(view -> {
            counter--;
            updateCounterText();
        });

        resetButton.setOnClickListener(view -> {
            counter = 0;
            updateCounterText();
        });
    }

    private void updateCounterText() {
        counterText.setText(String.valueOf(counter));
    }
}
