package com.example.health_and_care;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.embedding.android.SplashScreen;

public class CustomSplashScreen implements SplashScreen {
    private CustomSplashScreenView splashView;
    @Nullable
    public View createSplashView(@NonNull Context context, @Nullable Bundle bundle) {
        if (splashView == null) {
            splashView = new CustomSplashScreenView(context);
            splashView.restoreSplashState(bundle);
        }
        return splashView;
    }
    //closing the splash
    public void transitionToFlutter(Runnable onTransitionComplete) {
        if (splashView != null) {
            splashView.animateAway(onTransitionComplete);
        }
        else {
            onTransitionComplete.run();
        }
    }
    //state saving
    @Override
    public boolean doesSplashViewRememberItsTransition() {
        return true;
    }
    @Override
    @Nullable
    public Bundle saveSplashScreenState() {
        if (splashView != null) {
            return splashView.saveSplashState();
        } else {
            return null;
        }
    }
}

