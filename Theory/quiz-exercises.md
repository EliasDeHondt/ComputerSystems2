![logo](/Images/logo.png)
# 💙🤍Quiz Exercises🤍💙

This is a collection of quiz exercises for the course Operating Systems 2.

---

## 📘Table of Contents

1. [Introduction](#introduction)
2. [Booting & I/O output](#booting--io-output-1)
3. [I/O & bestandsbeheer](#io--bestandsbeheer-2)
4. [Geheugenbeheer](#geheugenbeheer-3)
5. [Processen](#processen-4)
6. [Interprocess communicatie](#interprocess-communicatie-5)
7. [UI & Virtualisatie](#ui--virtualisatie-6)
8. [Links](#links)

---

## 🖖Introduction

This is a collection of quiz exercises for the course Operating Systems 2. The questions are divided into 6 categories: Booting & I/O output, I/O & bestandsbeheer, Geheugenbeheer, Processen, Interprocess communicatie, UI & Virtualisatie.

## 🔄Booting & I/O output [1]

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

## 📂I/O & bestandsbeheer [2]

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

## 🧠Geheugenbeheer [3]

1. What is the difference between a monolytic, modular and micro kernel?
    > 1. **Monolytic kernel** -> This is a kernel that contains all the operating system functions in a single executable image.
    > 2. **Modular kernel** -> This is a kernel that contains the core functions in a single executable image and the other functions in modules.
    > 3. **Micro kernel** -> This is a kernel that contains only the core functions in a single executable image and the other functions in user space.

2. What is the job of the linker? Discuss the difference between static and dynamic linking. What are the advantages of dynamic linking?
    > The linker is a program that combines object files into an executable file. Static linking is the process of linking the object files into the executable file at compile time. Dynamic linking is the process of linking the object files into the executable file at run time. The advantage of dynamic linking is that the executable file is smaller. (.ddl) & (.so) files are used.

3. What is fixed partitioning? Which two are there?
    > 1. **Fixed memory partitioning** -> RAM Memory is divided into equal parts. (32M/4 = 8M)
    > 2. **Dynamic memory partitioning** -> RAM Memory is divided into unequal parts. (32M = 16M, 8M, 4M, 4M)

4. What is internal fragmentation in fixed memory partitioning? Give an example.
    > Internal fragmentation is the wasted space within a memory segment due to the fact that the allocated space is larger than the actual space required. An example is memory that is 32M in size and is divided into 4 partitions of 8M, 8M, 8M and 8M. And the program is 4M in size.

5. What is dynamic partitioning?
    > Dynamic partitioning is the process of dividing the memory into partitions of different sizes.

6. What is external fragmentation in dynamic partitioning of the memory? Give an example. What is the solution for this problem?
    > External fragmentation is the non sequential allocation of memory blocks. This occurs when memory blocks are freed and new memory blocks are allocated. The new memory blocks are stored in the empty memory blocks, but the empty memory blocks are not always sequential. The solution is **compaction**.

7. Explain how segmenting works.
    > Segmentation is the process of dividing the memory into segments of different sizes. Each segment has a segment number and a segment length. The segment number is used to address the segment. The segment length is used to determine the size of the segment.

8. What is a segmentation fault?
    > A segmentation fault is an error that occurs when a program tries to access memory that it does not have access to.

9. What is virtual memory? How does virtual memory work?
    > Virtual memory is a memory management technique that allows a computer to compensate for physical memory shortages by temporarily transferring data from random access memory (RAM) to disk storage. Virtual memory works by using a page table to map the virtual addresses to the physical addresses.

10. What is thrashing?
    > Thrashing is a condition in which excessive paging occurs, causing the system to spend more time paging than executing.

11. What is a page fault? How does the OS respond to this?
    > A page fault is an error that occurs when a program tries to access a page that is not in memory. The OS responds to this by loading the page into memory.

## ⚙️Processen [4]

1. Discuss the parts of a process: stack, data, code, PCB
    > 1. **Stack** -> This is the part of the process that stores the local variables and function calls.
    > 2. **Data (heap)** -> This is the part of the process that stores the global variables and dynamic memory.
    > 3. **Code (machine code)** -> This is the part of the process that stores the machine code.
    > 4. **PCB (Process Control Block)** -> This is the part of the process that stores the process information.

2. Explain the 5 states of a process and explain the transitions.
    > 1. **New** -> This is the state of a process that is being created.
    > 2. **Ready** -> This is the state of a process that is ready to run.
    > 3. **Running** -> This is the state of a process that is running.
    > 4. **Blocked** -> This is the state of a process that is waiting for an event.
    > 5. **Exit** -> This is the state of a process that is finished.

3. What is a PCB?
    > PCB stands for Process Control Block. This is a data structure that contains information about a process.

4. What is idle time?
    > Idle time is the time that the CPU is not being used.

5. What happens during a pre-emptive context switch?
    > During a pre-emptive context switch, the CPU switches from one process to another. The CPU saves the state of the current process and loads the state of the next process.

6. What is the difference between pre-emptive and non-pre-emptive scheduling?
    > Pre-emptive scheduling is a scheduling method that allows the CPU to switch from one process to another. Non-pre-emptive scheduling is a scheduling method that does not allow the CPU to switch from one process to another.

7. What is a context switch?
    > A context switch is the process of saving the state of the current process and loading the state of the next process.

8. What is scheduling?
    > Scheduling is the process of determining which process will run on the CPU.

9. How does a process start in Linux? Explain the fork(); and exec(); system calls.
    > A process starts in Linux by using the fork(); and exec(); system calls. The fork(); system call creates a new process by duplicating the calling process. The exec(); system call replaces the current process image with a new process image.

10. What is starvation?
    > Starvation is a condition in which a process is unable to run because it is waiting for a resource that is being held by another process.

## 🤝Interprocess communicatie [5]

1. What are pipes?
    > Pipes are a method of interprocess communication that allows the output of one process to be used as the input of another process.
    > e.g. `cat file.txt | grep "hello" | wc -l > result.txt`

2. What steps do you need to go through to send a message from one process to another in Unix?
    > 1. Create a message queue. `msgget`
    > 2. Send a message to the message queue. `msgsnd`
    > 3. Receive a message from the message queue. `msgrcv`
    > 4. Delete the message queue. `msgctl`

3. What steps do you need to go through to set up a shared memory segment in Unix?
    > 1. Create a shared memory segment. `shmget`
    > 2. Attach the shared memory segment to the address space of the process. `shmat`
    > 3. Detach the shared memory segment from the address space of the process. `shmdt`
    > 4. Delete the shared memory segment. `shmctl`

4. How can the OS share some memory between different processes?
    > The OS can share some memory between different processes by using shared memory. Shared memory is a memory segment that is shared by multiple processes. The memory segment is attached to the address space of the process.

5. Which memory segments are shared by threads?
    > The data (heap) and code (machine code) memory segments are shared by threads. The stack memory segment is not shared by threads. Each thread has its own stack memory segment.

6. What is the difference between a process and a thread?
    > A process is an instance of a program that is being executed. A thread is a sequence of instructions that can be executed independently of other threads.

7. What are the advantages and disadvantages of threads?
    > The advantages of threads are that they are lightweight and they share memory. The disadvantages of threads are that they are difficult to debug and they are difficult to synchronize.

8. What is the difference between a user-level thread and a kernel-level thread? What are the pros and cons?
    > - **User-level thread** Con -> The OS does not see any distinction between the process and all threads within it.
    > - **User-level thread** Pro -> The OS does not need to do many context switches.
    > - **Kernel-level thread** Con -> The OS needs to do many context switches.
    > - **Kernel-level thread** Pro -> The OS can schedule the threads independently.

9. Why are local variables not shared between threads while global ones are?
    > Local variables are not shared between threads because each thread has its own stack memory segment. Global variables are shared between threads because the data (heap) memory segment is shared between threads.

10. What is load balancing in a multiprocessor?
    > Load balancing is the process of distributing the workload evenly across all processors (cores).

11. What is the difference between a master-slave and an SMP multiprocessor OS?
    > - **Master-slave** -> The master processor (core) is responsible for scheduling the processes. The slave processors (cores) are responsible for executing the processes. The master processor (core) is a single point of failure. (Dictatorship)
    > - **SMP** -> All processors (cores) are responsible for scheduling and executing the processes. All processors (cores) are equal. (Democracy)

12. What is a 'critical section'?
    > A critical section is a section of code that can only be executed by one thread at a time.

13. Explain what a semaphore is. What operations can you perform on it and what do they do?
    > A semaphore is a synchronization mechanism that is used to control access to a shared resource. The operations that can be performed on a semaphore are:
    > - **sem_wait** -> This operation decrements the value of the semaphore. If the value of the semaphore is less than or equal to zero, the thread is blocked. (x <= 0 = block)
    > - **sem_post** -> This operation increments the value of the semaphore. If the value of the semaphore is greater than zero, the thread is unblocked. (x > 0 = unblock)

14. Explain what deadlocks are. When do they happen?
    > A deadlock is a condition in which two or more threads are waiting for each other to release a resource. Deadlocks happen when two or more threads are waiting for each other to release a resource.

## 🖥️UI & Virtualisatie [6]

1. What components does X-Windows consist of?
    > A complete -> X-server -> mouse, keyboard, screen.
        > 1. **Window manager** -> This is the part of the X-Windows system that manages the windows.
        >   - Minimize
        >   - Maximize
        >   - Close
        >   - Move
        >   - Resize
        > 2. **Desktop environment** -> This is the part of the X-Windows system that provides a graphical user interface.
        >   - Menu
        >   - Tool bar
        >   - Wallpaper
        >   - Icons
        > 3. **Display manager** -> This is the part of the X-Windows system that manages the display.
        >   - Login screen
        >   - Session

2. What is a Window manager?
    > A window manager is a program that manages the windows. It is responsible for minimizing, maximizing, closing, moving and resizing the windows.

3. What is RDP?
    > RDP stands for Remote Desktop Protocol. This is a protocol that allows a user to connect to a remote computer. The user can use the remote computer as if it were his own computer.

4. What is a thin client?
    > A thin client is a computer that does not have a hard drive. It uses a remote computer to run programs.

5. What is data deduplication?
    > Data deduplication is a technique that eliminates duplicate copies of data. This reduces the amount of storage space required.

6. What is the difference between SAN and NAS?
    > 1. **SAN (Storage Area Network)** -> This is a network that provides access to consolidated, block-level data storage.
    > 2. **NAS (Network Attached Storage)** -> This is a network that provides access to consolidated, file-level data storage.

7. Why is virtualization used?
    > Virtualization is used to reduce costs, increase efficiency and improve security. It is also used to consolidate servers and to provide a test environment.

8. What is Full virtualisation - Hosted hypervisor, Full virtualisation - Bare Metal hypervisor, paravirtualization, OS virtualization?
    > 1. **Full virtualisation - Hosted hypervisor** -> This is a type of virtualisation in which the hypervisor runs on top of the host operating system. `Hardware -> Host OS -> Hypervisor -> Guest OS`.
    > 2. **Full virtualisation - Bare Metal hypervisor** -> This is a type of virtualisation in which the hypervisor runs directly on the hardware. `Hardware -> Hypervisor -> Guest OS`.
    > 3. **Paravirtualization** -> This is a type of virtualisation in which the guest operating system is modified to run on top of the hypervisor. `Hardware -> Hypervisor -> Guest OS`.
    > 4. **OS virtualization** -> This is a type of virtualisation where the guest OS uses the underlying kernel of the host OS. `Hardware -> Host OS (Kernel) -> Guest OS`.

9. What is Public cloud, Private cloud, Hybrid cloud?
    > 1. **Public cloud** -> This is a cloud that is owned and operated by a third-party cloud service provider. e.g. Amazon Web Services (AWS), Microsoft Azure, Google Cloud Platform (GCP).
    > 2. **Private cloud** -> This is a cloud that is owned and operated by an organization. e.g. On-premises, Co-location.
    > 3. **Hybrid cloud** -> This is a cloud that is a combination of a public cloud and a private cloud.

10. What is IAAS, PAAS, SAAS?
    > 1. **IAAS (Infrastructure as a Service)** -> This is a cloud computing service that provides Network, Storage and Compute resources.
    > 2. **PAAS (Platform as a Service)** -> This is a cloud computing service that provides Network, Storage, Compute resources, Middleware and runtime environments.
    > 3. **SAAS (Software as a Service)** -> This is a cloud computing service that provides Network, Storage, Compute resources, Middleware, runtime environments and Applications.

11. What are Blade servers, what do they share?
    > Blade servers are servers that are designed to be installed in a blade enclosure. They share power, cooling, networking and management.

## 🔗Links
- 👯 Web hosting company [EliasDH.com](https://eliasdh.com).
- 📫 How to reach us eliasdehondt@outlook.com.