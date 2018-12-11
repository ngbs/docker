# Advanced
    usage: chinadns [-h] [-l IPLIST_FILE] [-b BIND_ADDR] [-p BIND_PORT]
           [-c CHNROUTE_FILE] [-s DNS] [-m] [-v] [-V]
    Forward DNS requests.

    -l IPLIST_FILE        path to ip blacklist file

    -c CHNROUTE_FILE      path to china route file
                          if not specified, CHNRoute will be turned

    -d                    off enable bi-directional CHNRoute filter

    -y                    delay time for suspects, default: 0.3

    -b BIND_ADDR          address that listens, default: 127.0.0.1

    -p BIND_PORT          port that listens, default: 53

    -s DNS                DNS servers to use, default:
                          114.114.114.114,208.67.222.222:443,8.8.8.8

    -m                    use DNS compression pointer mutation
                          (backlist and delaying would be disabled)

    -v                    verbose logging

    -h                    show this help message and exit

    -V                    print version and exit

# About chnroute
You can generate latest chnroute.txt using this command:

    curl 'http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' | grep ipv4 | grep CN | awk -F\| '{ printf("%s/%d\n", $4, 32-log($5)/log(2)) }' > chnroute.txt

Online help: <https://github.com/clowwindy/ChinaDNS>