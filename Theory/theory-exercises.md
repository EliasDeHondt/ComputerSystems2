![logo](/Images/logo.png)
# 💙🤍Theory Exercises🤍💙

This are the theory exercises for the course Operating Systems 2.

---

## 📘Table of Contents

1. [Introduction](#introduction)
2. [Booting & I/O output](#booting--io-output)
    - [Exercise 1: Convert to the correct unit](#exercise-1-convert-to-the-correct-unit)
    - [Exercise 2: Where is the MBR located in Windows/Linux](#exercise-2-where-is-the-mbr-located-in-windowslinux)
    - [Exercise 3: Calculate position of character or pixel on screen](#exercise-3-calculate-position-of-character-or-pixel-on-screen)
3. [I/O & bestandsbeheer](#io--bestandsbeheer)
    - [Exercise 1: How to configer RAID 1 on Linux](#exercise-1-how-to-configer-raid-1-on-linux)
    - [Exercise 2: How to calculate internal fragmentation](#exercise-2-how-to-calculate-internal-fragmentation)
    - [Exercise 3: How to calculate I-nodes max file size](#exercise-3-how-to-calculate-i-nodes-max-file-size)
    - [Exercise 4: ZFS on Linux](#exercise-4-zfs-on-linux)
4. [Geheugenbeheer](#geheugenbeheer)
    - [Exercise 1: Ubuntu 20.04 kernel modules](#exercise-1-ubuntu-2004-kernel-modules)
    - [Exercise 2: Compile a file](#exercise-2-compile-a-file)
    - [Exercise 3: Memory management operation of the call stack](#exercise-3-memory-management-operation-of-the-call-stack)
5. [Processen](#processen)
6. [Interprocess communicatie](#interprocess-communicatie)
7. [UI & Virtualisatie](#ui--virtualisatie)
8. [Links](#links)


---

## 🖖Introduction

This repository contains the theory exercises for the course Operating Systems 2. The exercises are divided into the following categories: **Booting & I/O output**, **I/O & bestandsbeheer**, **Geheugenbeheer**, **Processen**, **Interprocess communicatie** and **UI & Virtualisatie**. The exercises are written in Markdown and can be viewed on GitHub or in a Markdown editor such as [Typora](https://typora.io/).

## 🔄Booting & I/O output

### 📝Exercise 1: Convert to the correct unit

- Binair
    | Power |       |        |           |
    | ----- | ----- | ------ | --------- |
    | 1 Ki  | 2^10  | 1024   | 1,024 K   |
    | 1 Mi  | 2^20  | 1024^2 | 1,024^2 M |
    | 1 Gi  | 2^30  | 1024^3 | 1,024^3 G |
    | 1 Ti  | 2^40  | 1024^4 | 1,024^4 T |
    | 1 Pi  | 2^50  | 1024^5 | 1,024^5 P |
    | 1 Ei  | 2^60  | 1024^6 | 1,024^6 E |
    | 1 Zi  | 2^70  | 1024^7 | 1,024^7 Z |
    | 1 Yi  | 2^80  | 1024^8 | 1,024^8 Y |

- Decimaal
    | Power |       |        |             |
    | ----- | ----- | ------ | ----------- |
    | 1 K   | 10^3  | 1000   | 1,024^-1 Ki |
    | 1 M   | 10^6  | 1000^2 | 1,024^-2 Mi |
    | 1 G   | 10^9  | 1000^3 | 1,024^-3 Gi |
    | 1 T   | 10^12 | 1000^4 | 1,024^-4 Ti |
    | 1 P   | 10^15 | 1000^5 | 1,024^-5 Pi |
    | 1 E   | 10^18 | 1000^6 | 1,024^-6 Ei |
    | 1 Z   | 10^21 | 1000^7 | 1,024^-7 Zi |
    | 1 Y   | 10^24 | 1000^8 | 1,024^-8 Yi |

- 68 608 = x Ki
> (68.608 / 1.024 = **67 Ki**)
- 46 080 = x Ki
> (46.080 / 1.024 = **45 Ki**)
- 5 242 880 = x Mi
> ((5.242.880 / 1.024) / 1024 = **5 Mi**)
- 150 KiB = x KB
> (150 KiB * 1,024 = **153,6 KB**)
- 300 MiB = x MB
> (300 MiB * 1,024^2 = **314,5728 MB**)
- 2 GB = x GiB
> (2 GB * 1,024^-3 = **1,8626 GiB**)
- 5 MB = x MiB
> (5 MB * 1.024^-2 = **4,7683 MiB**)
- Past een bestand van 95 GiB op een HD van 100 GB?
> 95 GiB * 1,024^3 = 102,0054 GB 102,0054 GB > 100 GB Dus **Nee**
- 0x100000 = x xi
> 1*16^5 = (1.048.576 / 1.024) / 1.024 = **1 Mi**
- 0x4000 0000 = x xi
> 5*16^7 = (((1.342.177.280) / 1.024) / 1.024) / 1.024 = **1,25 Gi**

### 📝Exercise 2: Where is the MBR located in Windows/Linux

- The MBR is located at the first sector of the hard disk (sector 0, cylinder 0, head 0).

- In Windows you can find the MBR at `\\.\PhysicalDrive0`.
```powershell
PS C:\> $mbr = [byte[]](0..511)
PS C:\> $stream = New-Object System.IO.FileStream '\\.\PhysicalDrive0', 'Open', 'Read', 'Read'
PS C:\> $stream.Read($mbr, 0, 512)
PS C:\> $stream.Close()
PS C:\> $mbr | Format-Hex
# or -> https://mh-nexus.de/en/hxd/
```
- `$mbr = [byte[]](0..511)`: Creates an array of 512 bytes.
- `$stream = New-Object System.IO.FileStream '\\.\PhysicalDrive0', 'Open', 'Read', 'Read'`: Opens the first hard drive as a file stream.
- `$stream.Read($mbr, 0, 512)`: Reads the first 512 bytes of the file stream into the array.
- `$stream.Close()`: Closes the file stream.
- `$mbr | Format-Hex`: Displays the array in hexadecimal format.

- In Linux you can find the MBR at `/dev/sda` or `/dev/hda`.
```bash
sudo dd if=/dev/sda bs=512 count=1 | hexdump -v
```
- `sudo`: Runs the command with administrative privileges.
- `dd`: Copies data, here used to read from a device.
- `if=/dev/sda`: Specifies the input file as the first hard drive.
- `bs=512`: Sets the block size to 512 bytes.
- `count=1`: Copies only 1 block (512 bytes in this case).
- `|`: Sends the output of the first command as input to the next.
- `hexdump -v`: Converts the binary data into a hexadecimal format for human-readable output.

![theory-exercises-1](/Images/theory-exercises-1.png)
> **Boot-loader (MBR)**: De eerste 446 bytes van de MBR bevatten doorgaans de boot-loader code.

> **Partition table**: De volgende 64 bytes (vanaf byte 446 tot 510) bevatten de partitietabel, die vier records van elk 16 bytes kan bevatten voor primaire partities.

> **Signature**: De laatste 2 bytes (vanaf byte 511 tot 512) vormen de MBR-handtekening. **0xAA55 = Bootable**.

### 📝Exercise 3: Calculate position of character or pixel on screen

- text-mode
    - 80x25
    - 1 character = 1 bytes

- graphics-mode
    - indexed
        - 1 pixel = 1 byte
    true color
        - 1 pixel = 3 bytes (RGB)

1. If the screen is in text-mode, put character 'A' on column 5 of line 10 of the screen.

    - (10 * 80) + 5 = **805**
    - VRAM[805] = 'A'

2. If the screen is in text-mode, put character 'A' on column 5 of line 10 of the screen. The VRAM is located at 0xA0000.

    - (10 * 80) + 5 = **805**
    - Convert 805 to hexadecimal:
        - 805 / 16 = 50,3125
        - 0,3125 * 16 = ***5***
        - 50 / 16 = 3,125
        - 0,125 * 16 = ***2***
        - 3 / 16 = 0,1875
        - 0,1875 * 16 = ***3***
        - ***3*** ***2*** ***5*** = **0x325**
    - 0xA0000 + 0x325 = **0xA0325**
    - VRAM[0xA0325] = 'A'

3. If the screen is in graphics-mode indexed (800x600), put kleur nummer 5 on column 300 of line 200 of the screen. The VRAM is located at 0x1E2345.

    - (200 * 800) + 300 = **160.300**
    - Convert 160.300 to hexadecimal:
        - 160.300 / 16 = 10.018,75
        - 0,75 * 16 = ***12 (C)***
        - 10.018 / 16 = 626,125
        - 0,125 * 16 = ***2***
        - 626 / 16 = 39,125
        - 0,125 * 16 = ***2***
        - 39 / 16 = 2,4375
        - 0,4375 * 16 = ***7***
        - 2 / 16 = 0,125
        - 0,125 * 16 = ***2***
        - ***2*** ***7*** ***2*** ***2*** ***12*** = **0x02722C**
    - 0x1E2345 + 0x02722C = **0x209571**

## 📂I/O & bestandsbeheer

### 📝Exercise 1: How to configer RAID 1 on Linux

1. Partitioning
```bash
sudo fdisk
```
- `sudo`: Runs the command with administrative privileges.
- `fdisk`: Starts the fdisk utility.

2. RAID 1 configure
```bash
sudo mdadm --create /dev/md0 --level=mirror --raid-devices=2 /dev/sdb1 /dev/sdc1
sudo mdadm --detail /dev/md0
sudo mdadm --examine /dev/sdb1 /dev/sdc1
```
- `mdadm`: Starts the mdadm utility.
- `--create`: Creates a new RAID device.
- `/dev/md0`: Specifies the name of the RAID device.
- `--level=mirror`: Specifies the RAID level.
- `--raid-devices=2`: Specifies the number of RAID devices.
- `/dev/sdb1 /dev/sdc1`: Specifies the RAID devices.
- `--detail`: Displays detailed information about the RAID device.
- `--examine`: Displays detailed information about the RAID devices.

3. Formatteren
```bash
sudo mkfs.ext4 /dev/md0
```
- `mkfs.ext4`: Formats the RAID device as ext4.

4. Mounting
```bash
sudo mount /dev/md0 /mnt/raid1
```
- `mount`: Mounts the RAID device to the specified mount point.

### 📝Exercise 2: How to calculate internal fragmentation

- Block size = 4096 bytes
- File size = 10.000 bytes
- File size = 10.000 / 4096 = 2,44140625 blocks
- So we need 3 blocks because it would not fit into 2 blocks.
- Internal fragmentation = 3 * 4096 - 10.000 = **288 bytes**

### 📝Exercise 3: How to calculate I-nodes max file size

- Block size = 4096 bytes
- Pointer size = 4 bytes
- 13 * 4096 + 1024 * 4096 + 1024^2 * 4096 + 1024^3 * 4096 approximately **4099.78 GiB**

### 📝Exercise 4: ZFS on Linux

- Install ZFS
```bash
sudo apt install zfsutils-linux
```

- Create a pool
```bash
sudo zpool create new-pool /dev/sdb1 /dev/sdc1 # striping
sudo zpool create new-pool mirror /dev/sdb1 /dev/sdc1 # mirroring
sudo zpool create -m /usr/share/pool new-pool mirror /dev/sdb1 /dev/sdc1 # includes mounting
sudo zpool status
sudo zpool destroy new-pool
```

## 🧠Geheugenbeheer

### 📝Exercise 1: Ubuntu 20.04 kernel modules

1. The loadable kernel modules in Ubuntu Linux have the extension **.ko**.
2. These modules are usually located in the folder **/lib/modules**.
3. The command **lsmod** lists all the currently loaded kernel modules.

### 📝Exercise 2: Compile a file

- File: **myApp.c**
```c
#include <stdio.h>

extern int fib(int i);

int main() {
	int i = 5;
	int f = fib(i);
	printf("fib(%d) = %d\n", i, f);
}
```

- File: **fib.c**
```c
int fib(int i) {
	if (i < 3)
		return 1;
	else
		return fib(i-1) + fib(i-2);
}

int foo() {
	return fib(3);
}
```

- Compile Static Linking
```bash
sudo gcc -c myApp.c fib.c
sudo gcc -o myApp myApp.o fib.o
sudo ./myApp
```

- Compile Dynamic Linking
```bash
# Compile to .so file
sudo gcc -c -fPIC fib.c
sudo gcc -shared -Wl,-soname,libfib.so.1 -o libfib.so.1.0 fib.o
sudo ln -s libfib.so.1.0 libfib.so.1
sudo ln -s libfib.so.1.0 libfib.so

# Compile myApp with .so
sudo gcc -L. myApp.c -lfib -o myApp_dyn LD_LIBRARY_PATH=. export LD_LIBRARY_PATH

# Run myApp_dyn
sudo ./myApp_dyn

# Look for dependencies
sudo ldd myApp_dyn
```

### 📝Exercise 3: Memory management operation of the call stack

```c
main() {
    int a = fac(2);
    // Param=2 - > return-value (2) -> return address -> result=2 -> stack
}

int fac(int i) {
    int result = 0;
    if (i < 2) result=1;
    else result=fac(i-1)*i;
    return result;
    // Param=1 -> return-value (1) -> return address -> result=1 -> stack
}
```

## ⚙️Processen

## 🤝Interprocess communicatie

## 🖥️UI & Virtualisatie

## 🔗Links
- 👯 Web hosting company [EliasDH.com](https://eliasdh.com).
- 📫 How to reach us eliasdehondt@outlook.com.