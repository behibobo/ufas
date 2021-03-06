import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_openvpn/flutter_openvpn.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

class Ovpn extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Ovpn> {
  Future<Directory> _appLibraryDirectory;

  Future<String> getFileData(String path) async {
    return await rootBundle.loadString(path);
  }

  void initState() {
    FlutterOpenvpn.init();
    super.initState();
  }

  Future<void> initPlatformState() async {
    await FlutterOpenvpn.lunchVpn(
      """client
proto tcp-client
remote 185.112.34.242 1194
auth-user-pass
dev tun
resolv-retry infinite
nobind
persist-key
persist-tun
remote-cert-tls server
verify-x509-name server_mhRWhl21bLqiXATB name
auth SHA256
auth-nocache
cipher AES-128-GCM
tls-client
tls-version-min 1.2
tls-cipher TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256
ignore-unknown-option block-outside-dns
setenv opt block-outside-dns # Prevent Windows 10 DNS leak
verb 3
<ca>
-----BEGIN CERTIFICATE-----
MIIBwTCCAWegAwIBAgIJAI9dRlNZFpkiMAoGCCqGSM49BAMCMB4xHDAaBgNVBAMM
E2NuX3FKNm5SVktjM0Y2M0NJc1MwHhcNMjAxMjA4MjA0NDE1WhcNMzAxMjA2MjA0
NDE1WjAeMRwwGgYDVQQDDBNjbl9xSjZuUlZLYzNGNjNDSXNTMFkwEwYHKoZIzj0C
AQYIKoZIzj0DAQcDQgAE3GvdzbsA5WSTJBv6QB9lfDhfrrSwrfu0Q+ywUpWoO9mK
t1msAwTVTjd+zSkD/fMX/gXjo3x5bR4HpbzkO+Y5FKOBjTCBijAdBgNVHQ4EFgQU
z62BbVFiRI94eDyF+zNf+zcolcswTgYDVR0jBEcwRYAUz62BbVFiRI94eDyF+zNf
+zcolcuhIqQgMB4xHDAaBgNVBAMME2NuX3FKNm5SVktjM0Y2M0NJc1OCCQCPXUZT
WRaZIjAMBgNVHRMEBTADAQH/MAsGA1UdDwQEAwIBBjAKBggqhkjOPQQDAgNIADBF
AiEA2HnhyxdVThtMlXY6mKepoDBnjp1dnvX3rKwLlYVUvsICIHwsDNF8Ry4g3v7w
rk+dW4+wkYNbFiV7Z4gYAf1FV9AW
-----END CERTIFICATE-----
</ca>
<cert>
-----BEGIN CERTIFICATE-----
MIIBzjCCAXSgAwIBAgIRAOfj1SCc9JhxhUQQu+cKRzQwCgYIKoZIzj0EAwIwHjEc
MBoGA1UEAwwTY25fcUo2blJWS2MzRjYzQ0lzUzAeFw0yMDEyMDgyMDQ0MzBaFw0y
MzAzMTMyMDQ0MzBaMBExDzANBgNVBAMMBmNsaWVudDBZMBMGByqGSM49AgEGCCqG
SM49AwEHA0IABJNZvUSlzHz6x2ZqIbbkOo9+K3hx88sU0jykD/xc8Wgt9Jgf/LVo
RLt8xf28VqRxevdOCnIqwW47NjtipddiRYGjgZ8wgZwwCQYDVR0TBAIwADAdBgNV
HQ4EFgQU71RxaBvXLRiJIed8ISuSE8yoKukwTgYDVR0jBEcwRYAUz62BbVFiRI94
eDyF+zNf+zcolcuhIqQgMB4xHDAaBgNVBAMME2NuX3FKNm5SVktjM0Y2M0NJc1OC
CQCPXUZTWRaZIjATBgNVHSUEDDAKBggrBgEFBQcDAjALBgNVHQ8EBAMCB4AwCgYI
KoZIzj0EAwIDSAAwRQIgENEJIYFCqDhRbedMLa2uE4cSgc5jCsfLlVXy0kp62gUC
IQCZW1xVXIqSsDbVY+GFJgcxVEAiTJyQZOe97MNCLb7jVA==
-----END CERTIFICATE-----
</cert>
<key>
-----BEGIN PRIVATE KEY-----
MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQg6P1Jka8mZsjSTZri
nzSRWYRcWh1e71HWZ13ei0rptbOhRANCAASTWb1Epcx8+sdmaiG25DqPfit4cfPL
FNI8pA/8XPFoLfSYH/y1aES7fMX9vFakcXr3TgpyKsFuOzY7YqXXYkWB
-----END PRIVATE KEY-----
</key>
<tls-crypt>
#
# 2048 bit OpenVPN static key
#
-----BEGIN OpenVPN Static key V1-----
7c474a0027ad431fc52b9b3bffe204a6
8b890f826489736634f4d856f8bf31bc
eefff8045a37dbeaa2b2ab11f4ccad03
e076dd26a63ab304ad8523c534f7eff5
c69154058971a629a80f285897d8849f
b15526997593e551035e04f5c74c47e2
9bc1fec75142b9a96a0c163bc9bfe168
d3cd609d73fe40442204ab52f0fa757c
a384af4c761d6fa8bc77f00b7e86659f
b367df61c331d76ab3da5ccc6832f0fc
ecb2b2edb21a1c36506c372167bc5d19
6df88895373b016f043fc07428570c4b
e72f735c602ebc6e83ed63d52f85f969
15cbcee43b4f6457fd5679b8adc7d84a
9e584ad2f46716008929c459b7147746
aa0dce2a8e77e3d5462a63b15f65071e
-----END OpenVPN Static key V1-----
</tls-crypt>""",
      (isProfileLoaded) {
        print('isProfileLoaded : $isProfileLoaded');
      },
      (vpnActivated) {
        print('vpnActivated : $vpnActivated');
      },
      user: 'vpnclient01',
      pass: '*pkFY44@Ff',
      onConnectionStatusChanged:
          (duration, lastPacketRecieve, byteIn, byteOut) => print(byteIn),
      expireAt: DateTime.now().add(
        Duration(
          days: 999,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text("Sample"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {
              initPlatformState();
            },
            child: Text("Connect"),
          )
        ],
      ),
    );
  }
}
