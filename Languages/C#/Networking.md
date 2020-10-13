---
title: C# Networking
keywords:
---

# Network Programming in C#

System.Net

Classes 
(App Layer ish) High Level
    WebClient
    WebRequest
    HttpClient
    HttpListener
    SmtpClient
    Dns

(Transport / link layer) Low Level
    TcpClient
    TcpListener
    UdpClient
    Socket

## IP & Dns

```cs
var ipv4addr = new IPAddress (new byte[]{ 192, 168, 0, 1 });
var ipv4addr = IPAddress.Parse ("192.168.0.l1");
var ipv6addr = IPAddress.Parse
    ("[FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF]");
```

class `IPEndPoint` represents an IPaddress and port

class `Uri` can be used to work with uri's

Use `Dns` to resolve ipaddress `IPAddress ipa = Dns.GetHostAddresses("google.com")[0];` - Alternately use `GetHostAddressesAsync`

## Transport layer

Udp connectionless <> Tcp connectionbased

Use tcp through either `TcpClient` and `TcpListener` facades or the `Socket` class.

```cs
// barebones tcp client program
using (TcpClient client = new TcpClient())
{
    client.Connect("ipaddr", port);
    using (NetworkStream n = client.GetStream())
    {
        // network IO
    }
}
```

