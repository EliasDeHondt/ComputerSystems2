![logo](/Images/logo.png)
# 💙🤍Math Exercises🤍💙

This is a collection of math exercises for the course Operating Systems 2.

---

## 📘Table of Contents

1. [Introduction](#introduction)
2. [Booting & I/O output](#booting--io-output-1)
    - [Exercise 1: Convert](#exercise-1-convert)
    - [Exercise 2: The screen 1 (text-mode)](#exercise-2-the-screen-1-text-mode)
    - [Exercise 3: The screen 2 (text-mode)](#exercise-3-the-screen-2-text-mode)
    - [Exercise 4: The screen 3 (Indexed graphical mode)](#exercise-4-the-screen-3-indexed-graphical-mode)
3. [I/O & bestandsbeheer](#io--bestandsbeheer-1)
    - [Exercise 1: RAID-3](#exercise-1-raid-3)
    - [Exercise 2: Interne fragmentatie](#exercise-2-interne-fragmentatie)
    - [Exercise 3: I-nodes](#exercise-3-i-nodes)
4. [Geheugenbeheer](#geheugenbeheer-1)
    - [Exercise 1: Segment 1](#exercise-1-segment-1)
    - [Exercise 2: Segment 1](#exercise-2-segment-1)
    - [Exercise 3: Paging](#exercise-3-paging)
5. [Links](#links)

---

## 🖖Introduction

This is a collection of math exercises for the course Operating Systems 2. The exercises are divided into 3 categories: Booting & I/O output, I/O & bestandsbeheer and Geheugenbeheer. The completion of this file should not take more than 2 hours.

## 🔄Booting & I/O output

### 📝Exercise 1: Convert

1. 68.608 Bytes = ... KiB
> **(68.608 / 1.024 = 67 KiB)**
2. 46.080 Bytes = ... KiB
> **46.080 / 1.024 = 45 KiB**
3. 5.242.880 Bytes = ... MiB
> **5.242.880 / 1.024^2 = 5 MiB**
4. 150 KiB = ... KB
> **150 KiB * 1,024 = 153,6 KB**
5. 300 MiB = ... MB
> **300 MiB * 1,024^2 = 314,5728 MB**
6. 2 GB = ... GiB
> **2 GB * 1,024^-3 = 1,862645149 GiB**
7. 5 MB = ... MiB
> **5 MB * 1.024^-2 = 4,768371582 MiB**
8. Does a 95 GiB file fit on a 100 GB HD?
> **95 GiB * 1,024^3 = 102,0054 GB 102,0054733 GB > 100 GB Dus Nee**
9. 0x100000 = ...
> **1*16^5 = 1.048.576 / 1.024^2 = 1 MiB**
10. 0x4000 0000 = ...
> **4*16^7 = 1.048.576 / 1.024^3 = 1 GiB**

### 📝Exercise 2: The screen 1 (text-mode)

- Video card is in text mode.
- Put character 'A' on column 5 of line 10.
    > **10 * 80 + 5 = 805 (0x325)**

### 📝Exercise 3: The screen 2 (text-mode)

- Suppose VRAM is mapped to 0xA0000.
- Video card is in text mode.
- Put character 'A' on column 5 of line 10.
    > **10 * 80 + 5 = 805 (0x325 + 0xA0000 = 0xA0325)**

### 📝Exercise 4: The screen 3 (Indexed graphical mode)

- VRAM mapped to 0x1E2345.
- Video card is in indexed graphical mode (800x600).
- Set pixel (300, 200) to color number 5.
- Enter address in hexadecimal.
    > **200 * 800 + 300 = 160.300 (0x02722C + 0x1E2345 = 0x209571)**

## 📂I/O & bestandsbeheer

### 📝Exercise 1: RAID-3

- Disk 2 is broken and the following is read.
- 1010 1101, 1010 1100, xxxx xxxx, 0010 0000, 1001 0101.
- Enter the value of b2.
    > **1011 0100**

### 📝Exercise 2: Interne fragmentatie

- File size of 10 000 bytes.
- Blocks size of 4096 bytes.
- 1.000.000 files on disk.

- How many bytes are lost per file on average?
    > **2.288 bytes per file (Average = 55,859375%)**

- How much space is lost?
    > **2.288.000.000 bytes (2,130866051 GiB)**

### 📝Exercise 3: I-nodes

- Block size of 512 bytes, pointers will bestored as 32 bit unsigned integers.
    > **1 block = 128 pointers**

- How big can a file get without it creating indirects?
    > **13 * 512 = 6.656 bytes**

- How big can a file be without having double are indirects?
    > **(13 * 512) + (128 * 512) = 72.192 bytes**

- What is the maximum size a file can become?
    > **(13 * 512) + (128 * 512) + (128^2 * 512) + (128^3 * 512) = 1.082.202.624 bytes**

## 🧠Geheugenbeheer

### 📝Exercise 1: Segment 1

- 2 bits for segments.
- Segment table:
    - Nr: Base      , Length
    - 00: 0x00010000, 0x00000100
    - 01: 0x0011F000, 0x00100000
    - 02: 0x11000000, 0x00010000
    - 03: 0x20000000, 0x00001000
- Processor wants to read instruction at address 0x400FAE23.

- What is the physical address (hexadecimal)?
    > **0x000FAE23 + 0x0011F000 = 0x00219E23**

- What happens when jmp goes to 0x4010A003?
    > **No segment found**

- Size of segment?
    > **0x00100000**

- Number of segments?
    > **01**

### 📝Exercise 2: Segment 2

- 2 bits voor segmenten.
- Logical address: 1010 1100 0110 1101
- Segment table:
    - Nr: Base               , Length
    - 00: 0000 0010 0110 1100, 0000 0010 0001 0000
    - 01: 0001 0000 0100 1000, 0000 1011 0000 0110
    - 10: 1011 0000 0110 1011, 0011 0000 0000 0000
    - 11: 1001 1001 0110 1010, 0000 0000 0010 0000

- What is the physical address?
    > **10 1100 0110 1101 + 1011 0000 0110 1011 = 1101 1100 1101 1000**

- Offset within segment greater than length?
    > **Yes**

### 📝Exercise 3: Paging

- 8 bit pages.
- Logical address: 1101 1100 1101 1000
- Page table:
    - Page     , Frame
    - 1101 1011, 1110 1010
    - 1101 1100, 1110 1101
    - 1101 1101, 1110 1110

- Physical address?
    > **1110 1101 1101 1000**

## 🔗Links
- 👯 Web hosting company [EliasDH.com](https://eliasdh.com).
- 📫 How to reach us eliasdehondt@outlook.com.