package com.eajy.flutterdemo;

import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.widget.Toast;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "com.eajy.flutterdemo/android";

    private static final String SHARE_CONTENT = "A beautiful app designed with Material Design by using Flutter. \nhttps://play.google.com/store/apps/details?id=com.eajy.flutterdemo \n- Designed by Eajy in China";
    private static final String EMAIL_ADDRESS = "mailto:eajy.zhangxiao@gmail.com";
    private static final String EMAIL_SUBJECT = "Feedback:FlutterDemo";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        switch (call.method) {
                            case "share":
                                share();
                                result.success(null);
                                break;
                            case "getVersionName":
                                result.success(getVersionName());
                                break;
                            case "sendEmail":
                                sendEmail();
                                result.success(null);
                                break;
                            default:
                                result.notImplemented();
                                break;
                        }
                    }
                });
    }

    private void share() {
        Intent intent = new Intent();
        intent.setAction(Intent.ACTION_SEND);
        intent.putExtra(Intent.EXTRA_TEXT, SHARE_CONTENT);
        intent.setType("text/plain");
        startActivity(Intent.createChooser(intent, "Share with"));
    }

    private String getVersionName() {
        try {
            PackageManager manager = getPackageManager();
            PackageInfo info = manager.getPackageInfo(getPackageName(), 0);
            String version = info.versionName;
            return "Version: " + version;
        } catch (Exception e) {
            e.printStackTrace();
            return "Version: 1.0";
        }
    }

    private void sendEmail() {
        Intent intent = new Intent();
        intent.setAction(Intent.ACTION_SENDTO);
        intent.setData(Uri.parse(EMAIL_ADDRESS));
        intent.putExtra(Intent.EXTRA_SUBJECT, EMAIL_SUBJECT);
        try {
            startActivity(intent);
        } catch (Exception e) {
            Toast.makeText(this, "Not found Email app.", Toast.LENGTH_SHORT).show();
        }
    }

}
