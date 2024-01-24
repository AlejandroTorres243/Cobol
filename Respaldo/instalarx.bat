npm install -g @zowe/cli@zowe-v1-lts
zowe plugins install @zowe/secure-credential-store-for-zowe-cli@zowe-v1-lts
zowe profiles create zosmf learncobol --host 192.86.32.250 --port 10443 --ru false --user ZA0024 --pass ZAG01SAW --ow
zowe profiles set zosmf learncobol
zowe files list ds "ZA0024.*"