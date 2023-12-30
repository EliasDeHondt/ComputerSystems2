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
    - [Exam questions 1](#exam-questions-1)
3. [I/O & bestandsbeheer](#io--bestandsbeheer)
    - [Exercise 1: How to configer RAID 1 on Linux](#exercise-1-how-to-configer-raid-1-on-linux)
    - [Exercise 2: How to calculate internal fragmentation](#exercise-2-how-to-calculate-internal-fragmentation)
    - [Exercise 3: How to calculate I-nodes max file size](#exercise-3-how-to-calculate-i-nodes-max-file-size)
    - [Exercise 4: ZFS on Linux](#exercise-4-zfs-on-linux)
    - [Exam questions 2](#exam-questions-2)
4. [Geheugenbeheer](#geheugenbeheer)
    - [Exercise 1: Ubuntu 20.04 kernel modules](#exercise-1-ubuntu-2004-kernel-modules)
    - [Exercise 2: Compile a file](#exercise-2-compile-a-file)
    - [Exercise 3: Memory management operation of the call stack](#exercise-3-memory-management-operation-of-the-call-stack)
    - [Exercise 4: Calculate the physical address (segmentation)](#exercise-4-calculate-the-physical-address-segmentation)
    - [Exercise 5: Calculate the physical address (paging)](#exercise-5-calculate-the-physical-address-paging)
    - [Exercise 6: How to show the page size (Ubuntu 20.04)](#exercise-6-how-to-show-the-page-size-ubuntu-2004)
    - [Exam questions 3](#exam-questions-3)
5. [Processen](#processen)
    - [Exercise 1: Ubuntu process states](#exercise-1-ubuntu-process-states)
    - [Exercise 2: Scheduling Linux/Windows commands/UI list](#exercise-2-scheduling-linuxwindows-commandsui-list)
    - [Exercise 3: Nieuw proces starten in Unix](#exercise-3-nieuw-proces-starten-in-unix)
    - [Exercise 4: Nieuw proces in shell-scripts](#exercise-4-nieuw-proces-in-shell-scripts)
    - [Exercise 5: Ubuntu timeslice](#exercise-5-ubuntu-timeslice)
    - [Exercise 6: Scheduling in Linux](#exercise-6-scheduling-in-linux)
    - [Exam questions 4](#exam-questions-4)
6. [Interprocess communicatie](#interprocess-communicatie)
    - [Exam questions 5](#exam-questions-5)
7. [UI & Virtualisatie](#ui--virtualisatie)
    - [Exam questions 6](#exam-questions-6)
8. [Links](#links)

---

## 🖖Introduction

This repository contains the theory exercises for the course Operating Systems 2. The exercises are divided into the following categories: **Booting & I/O output**, **I/O & bestandsbeheer**, **Geheugenbeheer**, **Processen**, **Interprocess communicatie**, **UI & Virtualisatie** and **Exam questions**. It is recommended to read the theory first before attempting the exercises.

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

### ✒️Exam questions 1

1. What are the tasks of an operating system? Give a clear description per task.
    > 1. **Boot process** -> This is the startup procedure.
    > 2. **Hardware abstraction** -> This is the process of hiding the physical characteristics of a device from the user.
    > 3. **I/O management** -> This is the process of controlling the input and output operations of a computer.
    > 4. **File management** -> This is the process of organizing and keeping track of files and folders.
    > 5. **Process management** -> This is the process of managing the processes running on a computer.
    > 6. **Memory management** -> This is the process of managing the memory of a computer.
    > 7. **Window management** -> This is the process of managing the windows of a computer.

2. What is a Von Neumann architecture?
    > The Von Neumann architecture is a computer architecture based on the stored-program computer concept, where instruction data and program data are stored in the same memory.

3. How can a microprocessor address the ROM?
    > The microprocessor can address the ROM by using the address bus.

4. What is POST?
    > POST stands for Power-On Self-Test. This is a diagnostic testing sequence that is run by the computer's BIOS when the computer is turned on.

5. What is a HAL?
    > HAL stands for Hardware Abstraction Layer. This is a layer of programming that allows a computer operating system to interact with a hardware device at a general or abstract level rather than at a detailed hardware level.

6. What steps does the BIOS perform at startup?
    > 1. ROM firmware
    > 2. Boot loader
    > 3. Kernel
    > 4. Complete OS

7. What does the MBR look like?
    > MBR stands for Master Boot Record. The MBR is located at the first sector of the hard disk (sector 0, cylinder 0, head 0). The first 446 bytes of the MBR usually contain the boot loader code. The next 64 bytes (from byte 446 to 510) contain the partition table, which can contain four records of 16 bytes each for primary partitions. The last 2 bytes (from byte 511 to 512) form the MBR signature. **0xAA55 = Bootable**.

8. What are the differences between BIOS and UEFI? Explain.
    > BIOS stands for Basic Input/Output System. UEFI stands for Unified Extensible Firmware Interface. The BIOS is a firmware that is stored on a ROM chip on the motherboard. The UEFI is a firmware that is stored on a flash memory chip on the motherboard. The BIOS is a 16-bit firmware. The UEFI is a 32-bit or 64-bit firmware. The BIOS uses the MBR partitioning scheme. The UEFI uses the GPT partitioning scheme.

9. Which components are on a video card? Explain them.
    > 1. **Control unit** -> This is the part of the video card that controls the other components.
    > 2. **VRAM** -> This is the part of the video card that stores the image data. (Video Random Access Memory)
    > 3. **GPU** -> This is the part of the video card that processes the image data. (Graphics Processing Unit)
    > 4. **RAMDAC** -> This is the part of the video card that converts the digital image data to analog signals. (Random Access Memory Digital-to-Analog Converter)

10. What is memory-mapped I/O?
    > Memory-mapped I/O is a method for performing input/output between the CPU and peripheral devices. The CPU can address the peripheral devices as if they were memory locations.

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

### ✒️Exam questions 2

1. What is the difference between programmed I/O and interrupt driven I/O? 
    > The difference is that with programmed I/O the CPU has to wait for the I/O operation to complete. 

2. What is the advantage of interrupt driven IO?
    > With interrupt driven I/O the CPU can continue with other tasks while the I/O operation is being performed.

3. Explain the operation of a circular buffer. When full? When empty?
    > A circular buffer is a data structure that uses a single, fixed-size buffer as if it were connected end-to-end. This structure lends itself easily to buffering data streams. When the buffer is full, the oldest data is overwritten. When the buffer is empty, no data can be read. (Start = End)

4. What is an ISR? what does it do?
    > ISR stands for Interrupt Service Routine. This is a function that is called when an interrupt occurs. The ISR handles the interrupt and sends the result back to the CPU.

5. What is a DMA controller? What does this do? Why and who need it?
> DMA stands for Direct Memory Access. This is a feature of computer systems that allows certain hardware subsystems to access main system memory independently of the central processing unit (CPU). The DMA controller is a hardware component that manages the DMA transfers. The DMA controller is needed to transfer data between the I/O device and the main memory without the intervention of the CPU.

6. How does an HDD work? 
    > HDD stands for Hard Disk Drive.
    > 1. **Disk platters** -> This is the part of the HDD that stores the data.
    > 2. **Read/write head** -> This is the part of the HDD that reads and writes the data.
    > 3. **Cyliners** -> This is the part of the HDD that contains the tracks.
    > 4. **Tracks** -> This is the part of the HDD that contains the sectors.
    > 5. **Sectors** -> This is the part of the HDD that contains the data.

7. How does an SSD work?
    > SSD stands for Solid State Drive.
    > 1. **Interface** -> This is the part of the SSD that connects the SSD to the computer.
    > 2. **Controller** -> This is the part of the SSD that manages the data flow.
    > 3. **NAND flash memory** -> This is the part of the SSD that stores the data.

8. What is caching (for hard drives). What is the advantage? What is the disadvantage?
    > Caching is the process of storing data in a cache. The advantage is that the data can be accessed faster. The disadvantage is that the data can be lost if the cache is not flushed.

9. What is internal fragmentation in a file system? Give an example.
    > Internal fragmentation is the wasted space within a file or memory segment due to the fact that the allocated space is larger than the actual space required. An example is a file that is 10.000 bytes in size and is stored in 3 blocks of 4096 bytes. The last block is only partially filled.

10. What is (external) fragmentation of a hard drive? How does this occur?
    > External fragmentation is the non sequential allocation of data blocks in a Hard Disk Drive (HDD). This occurs when files are deleted and new files are created. The new files are stored in the empty blocks, but the empty blocks are not always sequential.

11. List five attributes associated with a file could be.
    > 1. **Name** -> This is the name of the file. (e.g. filename)
    > 2. **Type** -> This is the type of the file. (e.g. .txt)
    > 3. **Location** -> This is the location of the file. (e.g. /home/user/filename.txt)
    > 4. **Size** -> This is the size of the file. (e.g. 10.000 bytes)
    > 5. **Protection** -> This is the protection of the file. (e.g. rwxrwxrwx)

12. What is a "file allocation table"?
    > File Allocation Table (FAT) is a file system. The FAT file system is characterized by the file allocation table, which is a table that resides at the very "top" of the volume. The table contains entries for each cluster, which is a group of sectors. Each entry records one of five things: 
        > 1. The cluster is unused.
        > 2. The cluster is the last cluster of a file.
        > 3. The cluster is the last cluster of a file and it is bad.
        > 4. The cluster is the last cluster of a file and it is reserved.
        > 5. The cluster number of the next cluster in the file.

13. Determining the block size of a file system.
    > The block size of a file system can be determined by using the `stat` command.

14. What is LVM.
    > LVM stands for Logical Volume Manager. This is a device mapper target that provides logical volume management for the Linux kernel.
        > 1. **RAID Functionality**
        > 2. **Snapshots**
        > 3. **Encryption**
        > 4. **Dynamic Volume Resizing**

15. What are the properties of next generation file systems?
    > 1. **RAID Functionality**
    > 2. **Snapshots**
    > 3. **Copy-on-Write**
    > 4. **High Storage Capacity**
    > 5. **Protection Against Data Corruption**

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

- File: **fac.c**
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

- Compile
```bash
sudo gcc -o fac fac.c
sudo ./fac
```

### 📝Exercise 4: Calculate the physical address (segmentation)

- 2 bit segment number.
- Logical address = <span style="color:#4F94F0">**10**</span>10 1100 0110 1011
- Segment table
    | Segment | Start               | Length              |
    | ------- | ------------------- | ------------------- |
    | 00      | 0000 0010 0110 1100 | 0000 0010 0001 0000 |
    | 01      | 0001 0000 0100 1000 | 0000 1011 0000 0110 |
    | <span style="color:#4F94F0">**10**</span>  | 1011 0000 0110 1011 | 0011 0000 0000 0000 | 
    | 11      | 1001 1001 0110 1010 | 0000 0000 0010 0000 |

- Fysisch adres = 0010 1100 0110 1101 + 1011 0000 0110 1011 = **1101 1100 1101 1000**

### 📝Exercise 5: Calculate the physical address (paging)

- 8 bit page number.
- Logical address = <span style="color:#4F94F0">**1101 1100**</span> 1101 1000
- Page table
    | Page      | Frame     |
    | --------- | --------- |
    | 1101 1011 | 1110 1010 |
    | <span style="color:#4F94F0">**1101 1100**</span> | 1110 1101 |
    | 1101 1101 | 1110 1110 |

- Fysisch adres = 1110 1101 1101 1000
- Fysisch adres = Frame + Offset

### 📝Exercise 6: How to show the page size (Ubuntu 20.04)

```bash
sudo tree -h
```

### ✒️Exam questions 3

1. What is the difference between a monolytic, modular and micro kernel?
> 

2. What is the job of the left one? Discuss the difference between static and dynamic linking. What are the advantages of dynamic linking?
> 

3. What is fixed partitioning? what 2 shapes are there?
> 

4. What is internal fragmentation in fixed memory partitioning? Give an example
> 

5. What is dynamic partitioning?
> 

6. What is external fragmentation in dynamic partitioning of the memory? Give an example. What is the solution for this problem?
> 

7. Explain how segmenting works.
> 

8. What is a segmentation fault?
> 

9. What is virtual memory? How does virtual memory work?
> 

10. What is thrashing?
> 

11. What is a page fault? How does the OS respond to this?
> 

## ⚙️Processen

### 📝Exercise 1: Ubuntu process states

1. With which command can you activate the processes and see their process status?
```bash
sudo ps aux
# or
sudo ps -e
```

2. What states exist?

| Name     | Status |
| -------- | ------ |
| Running  | R      |
| Sleeping | S      |
| Sleep    | D      |
| Zombie   | Z      |
| Stopped  | T      |
| Idle     | I      |
| Dead     | X      |

3. Create a command that displays the status written out in full, followed by the name of the program that has that status.
```bash
sudo ps -e -o state,comm --no-headers | awk '{if ($1=="R") print "Running",$2; else if ($1=="S") print "Sleeping",$2; else if ($1=="D") print "Uninterruptible Sleep",$2; else if ($1=="Z") print "Zombie",$2; else if ($1=="T") print "Stopped",$2; else print $1,$2}'
# It is better to put this in a script :)
```

### 📝Exercise 2: Scheduling Linux/Windows commands/UI list

- Linux
    - `nice`: Runs a program with modified scheduling priority.
    - `renice`: Alters the scheduling priority of one or more running processes.
    - `top`: Displays Linux processes.
    - `ps`: Displays information about a selection of the active processes.
    - `pstree`: Displays the processes as a tree.
    - `kill`: Sends a signal to a process.
    - `killall`: Sends a signal to all processes running any of the specified commands.
    - `pkill`: Sends a signal to processes based on name and other attributes.
    - `pgrep`: Looks through the currently running processes and lists the process IDs which matches the selection criteria to stdout.
    - `xload`: System load average display for X.
    - `uptime`: Shows how long the system has been running + load.
    - `vmstat`: Reports information about processes, memory, paging, block IO, traps, disks and cpu activity.
    - `iostat`: Reports CPU statistics and I/O statistics for tty devices and disks.
    - `sar`: Collects, reports, or saves system activity information.
    - `mpstat`: Reports processors related statistics.
    - `free`: Displays the total amount of free and used physical and swap memory in the system, as well as the buffers and caches used by the kernel.
    - `top`: Displays Linux processes.
    - `htop`: Interactive process viewer.
    - `atop`: Advanced interactive monitor for Linux-systems to view the load on system-level and process-level.
    - `iotop`: Simple top-like I/O monitor.
    - `nmon`: Performance monitoring tool for Linux.
    - `dstat`: Versatile tool for generating system resource statistics.
    - `pidstat`: Monitors the usage of cpu, memory, io and threads.
    - `psacct`: Monitors system activities and used to keep track of the processes running on the system.
    - `lastcomm`: Displays information about previously executed commands.
    - `lsof`: Lists open files for running Linux processes.
    - `fuser`: Identifies processes using files or sockets.
    - `uptime`: Shows how long the system has been running + load.
    - `w`: Shows who is logged on and what they are doing.
    - `who`: Shows who is logged on.
    - `whoami`: Displays the effective username

- Windows
    - `tasklist`: Displays a list of currently running processes on the local computer.
    - `taskkill`: Ends one or more tasks or processes.
    - `wmic`: Displays WMI information inside interactive command shell.
    - `wmic process`: Displays information about processes.
    - `wmic process list`: Displays a list of currently running processes.
    - `wmic process list brief`: Displays a list of currently running processes in brief format.
    - `wmic process list full`: Displays a list of currently running processes in full format.
    - `wmic process where name="notepad.exe" get name, processid`: Displays the name and process ID of the notepad.exe process.
    - `wmic process where name="notepad.exe" call terminate`: Terminates the notepad.exe process.
    - `wmic process where name="notepad.exe" get name, processid /format:csv`: Displays the name and process ID of the notepad.exe process in CSV format.
    - `wmic process where name="notepad.exe" get name, processid /format:htable`: Displays the name and process ID of the notepad.exe process in HTML table format.
    - `wmic process where name="notepad.exe" get name, processid /format:list`: Displays the name and process ID of the notepad.exe process in list format.
    - `wmic process where name="notepad.exe" get name, processid /format:table`: Displays the name and process ID of the notepad.exe process in table format.
    - `wmic process where name="notepad.exe" get name, processid /format:value`: Displays the name and process ID of the notepad.exe process in value format.
    - `wmic process where name="notepad.exe" get name, processid /format:xml`: Displays the name and process ID of the notepad.exe process in XML format.
    - `wmic process where name="notepad.exe" get name, processid /format:xsl`: Displays the name and process ID of the notepad.exe process in XSL format.
    - `wmic process where name="notepad.exe" get name, processid /format:rawxml`: Displays the name and process ID of the notepad.exe process in raw XML format.
    - `wmic process where name="notepad.exe" get name, processid /format:json`: Displays the name and process ID of the notepad.exe process in JSON format.

- UI
    - `Task Manager`: Displays a list of currently running processes.
    - `Resource Monitor`: Displays information about processes, memory, paging, block IO, traps, disks and cpu activity.
    - `Performance Monitor`: Displays CPU statistics and I/O statistics for tty devices and disks.
    - `Process Explorer`: Displays information about processes.
    - `Process Hacker`: Displays information about processes.
    - `Process Monitor`: Displays information about processes.
    - `Process Lasso`: Displays information about processes.
    - `Process Tamer`: Displays information about processes.
    - `Process Piglet`: Displays information about processes.

### 📝Exercise 3: Nieuw proces starten in Unix

- `fork()`: Creates a new process by duplicating the calling process. The new process is referred to as the child process. The calling process is referred to as the parent process.
- `exec()`: Replaces the current process image with a new process image.

- Example File: **fork.c**
```c
#include <stdio.h>
#include <unistd.h>

int main() { // Parent process
    int i;
    for(i=0; i<10; i++) {
        int f = fork(); // 'fork' creates a new process by duplicating the calling process.
        if (f==0) {
            child(i);
            return 0;
        }
    }
    sleep(3);
    execl("/bin/ps","ps", "-f", NULL); // 'execl' replaces the current process image with a new process image.
    printf("Not printed!");
}

void child(int i) { // Child process
    printf("start of process %d\n",i);
    int t;
    for(t=0; t<5; t++) {
        sleep(1);
        printf("proces %d: tel=%d\n",i,t);
    }
}
```

- Compile
```bash
sudo gcc -o fork fork.c
sudo ./fork
```

### 📝Exercise 4: Nieuw proces in shell-scripts

- Example
```bash
sudo xload &
```
- `sudo`: Runs the command with administrative privileges.
- `xload`: System load average display for X.
- `&`: Runs the command in the background.

### 📝Exercise 5: Ubuntu timeslice

- What is the order of magnitude of the timeslice at Linux?
    - User processes: 100 ms
    - Kernel processes: 10 ms

```bash
sudo top # Column PR
```
- `sudo`: Runs the command with administrative privileges.
- `top`: Displays Linux processes.

Different priorities:
- New process: 20
- User process: 20 - 39
- Kernel process: 40 - 59
- Real time process: 60 - 99

### 📝Exercise 6: Scheduling in Linux

- File: **forkbomb.c**
```c
#include <stdio.h>
#include <unistd.h>

int main() {
	while(1){
	fork();
	printf("Child started!\n");
	}
}
```

- Compile
```bash
sudo gcc -o forkbomb forkbomb.c
sudo ./forkbomb
```

- Kill all processes
```bash
sudo killall forkbomb
```

### ✒️Exam questions 4

1. Discuss the parts of a process: stack, data, code, PCB
> 

2. Explain the 5 states of a process and explain the transitions.
> 

3. What is a PCB?
> 

4. What is idle time?
> 

5. What happens during a pre-emptive context switch?
> 

6. What is the difference between pre-emptive and non-pre-emptive scheduling?
> 

7. What is a context switch?
> 

8. What is scheduling?
> 

9. How does a process start in Linux? Explain the fork and exec system calls.
> 

10. What is starvation?
> 

## 🤝Interprocess communicatie

### ✒️Exam questions 5

1. What are pipes?
> 

2. What steps do you need to go through to send a message from one process to another in Unix?
> 

3. What steps do you need to go through to set up a shared memory segment in Unix?
>

4. How can the OS share some memory between different processes?
> 

5. Which memory segments are shared by threads?
>

6. What is the difference between a process and a thread?
>

7. What are the advantages and disadvantages of threads?
>

8. What is the difference between a user-level thread and a kernel-level thread? What are the pros and cons?
>

9. Why are local variables not shared between threads while global ones are?
>

10. What is load balancing in a multiprocessor?
> 

11. What is the difference between a master-slave and an SMP multiprocessor OS?
> 

12. What is a 'critical section'?
> 

13. Explain what a semaphore is. What operations can you perform on it and what do they do?
> 

14. Explain what deadlocks are. When do they perform?
> 

## 🖥️UI & Virtualisatie

### ✒️Exam questions 6

1. What components does X-Windows consist of?
> 

2. What is a Window manager?
> 

3. What is RDP?
> 

4. What is a thin client?
> 

5. What is data deduplication?
> 

6. What is the difference between SAN and NAS?
> 

7. Why is virtualization used?
> 

8. What is full virtualization, paravirtualization, hosted hypervisor, OS virtualization (with drawing)?
> 

9. What is Public, private, hybrid cloud?
> 

10. What is IAAS, PAAS, SAAS?
> 

11. What are Blade servers, what do they share?
> 

## 🔗Links
- 👯 Web hosting company [EliasDH.com](https://eliasdh.com).
- 📫 How to reach us eliasdehondt@outlook.com.