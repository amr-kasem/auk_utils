package com.auk.utils.auk_utils;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import java.net.NetworkInterface; 
import java.util.Collections; 
import java.util.List; 

/** AukUtilsPlugin */
public class AukUtilsPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  public String getWIFIMAC() { 
    try { 
      String interfaceName = "wlan0"; 
      List<NetworkInterface> interfaces = Collections.list(NetworkInterface.getNetworkInterfaces()); 
      for (NetworkInterface inter_face : interfaces) { 
        if (!inter_face.getName().equalsIgnoreCase(interfaceName)){ 
          continue; 
        }
        byte[] mac = inter_face.getHardwareAddress(); 
        if (mac==null){ 
          return ""; 
        } 

        StringBuilder buffer = new StringBuilder(); 
        for (byte aMac : mac) { 
          buffer.append(String.format("%02X:", aMac)); 
        } 
        if (buffer.length()>0) { 
          buffer.deleteCharAt(buffer.length() - 1); 
        } 
        return buffer.toString(); 
      } 
    } catch (Exception ignored) { } 
    return ""; 
  } 
  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "auk_utils");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success(android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("getMacAddress")) {
      result.success(getWIFIMAC());
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
