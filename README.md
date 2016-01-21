# FGJailbreakDetector
Detect if the device has been jailbroken by using the 3 ways

- Check if Cydia is existed
- Check if your application is running from inside a restricted sandbox
- Using the `lstat` function to check if '/Applications' folder is actually a directory or just a symbolic link. A symbolic link means the device has been jailbroken.

Simulator will return NO.

##How to Use
Simply `import "FGJailbreakDetector.h"`, then `[FGJailbreakDetector hasJailbroken]` will return YES if device has been jailbroken otherwise, NO.


