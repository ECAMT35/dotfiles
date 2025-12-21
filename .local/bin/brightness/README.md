Ensure Correct GPU Backlight Interface, Permissions, and Script Execution

1. Identify the active backlight interface 
```bash
$ ls /sys/class/backlight/
amdgpu_bl1  nvidia_0
```

2. Configure permissions for the correct interface
```bash
echo "$(whoami) ALL=(ALL) NOPASSWD: /bin/tee /sys/class/backlight/<your interface>/brightness" | sudo tee "/etc/sudoers.d/brightness-$(whoami)"
```

3. Then change the scripts and execute
