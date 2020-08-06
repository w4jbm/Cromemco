# 16FDC Disk Controller Card

The 16FDC card includes a disk controller capable of directly selecting up to four drive (which would typically have beeen 8" or 5.25" drives) up to Dual Density/Double Sided (DD/DS) capacity.

It also includes a serial port, a ROM that can contain RDOS, and simple memory bank-select logic that maps out the ROM once Bank 0 RAM (on another card) has been selected. (A reset from the reset switch will map the ROM back in and take the user to BDOS.)

I'm documenting this in case I ever need to go through it again and assume that anyone else reading it is probably wanting to get a Cromemco system up and running. Before going any further, I want to recognize that none of this would have been possible without the prior work of Dave Dunfield, Marcus Bennett, and Herb Johnson. I've pulled thing together in one place and filled in a few gaps, but the whole "shoulders of giants" thing definately is true here.

For a while, I worked with the Tandom TM100 5.25" DD/DS drives that were installed in my Cromemco Z-2D. Knowing what I know now, if I was starting over and didn't have any 5.25" disks I wanted to retrieve the contents of, I would start with 3.5" drives. Most of this is a "walk through" of how I would suggest going about getting a system running.

The beginning of everything is making sure you can get to RDOS and that you are running v2.51. When you power the system up, press the enter key on the serial terminal a few times. You should see a message:

`Preparing to boot, ESC to abort`

If you presse the ESCAPE key, you should see the semicolon (";") prompt. Initially it is good to use the Test command by typing "T".

On bootup, the typical Cromemco will have the 16FDC's ROM mapped into memory at C000H. The ZPU card is normally configured to jump to C000H on startup. This is how RDOS gets started. The Cromemco memory cards are usually set to support up to 7 "Banks" each having up to 64K of RAM. On startup, typically Bank 0 will be mapped in with the lower 32K enabled and the upper 32K dissabled.

The "T" command will copy RDOS from C000H into lower memory, use an OUT 40,1 command to select Bank 0 (which also enables the upper 32K of RAM and maps the ROM out of the memory space), copies RDOS back up to C000H (which is now RAM) and returns control to the RAM copy of RDOS.

At that point it will perform a quick test to determine how much memory is available to the system.

WORK IN PROGRESS

As you start working with the disk drives, it is important to begin with a "known good" cable. The cable in my system had been "pinched" and although it looked generally okay visually and even tested okay with an ohmeter, the connector for drive A: would not work. (In fact, the configuration that initially worked for me was to have the A: drive connected to the B: location on the cable.)

For 34 conductor ribbon cables, the controller is designed for use with cables that are "straight through" and will NOT work with cables that have the "twist" commonly found on PC floppy cables. These cables can be a bit challenging to locate, but one with a twist can serve as a starting point if you cut the cable before the twist.

As you go through this, if you try to get a 3.5" drive working, I would suggest getting a dual-drive cable for a PC and then just cutting it off beyond the connector that is usually for the B: drive. It can be a bit confussing, but the default floppy drives for a PC are typically strapped to be the B: drive. It is the "twist" that changes the drive select and the motor control for the A: drive into the positions they need to be for a drive that is strapped for B:. There is only a single motor control line on the 16FDC, so a cable with the twist will not work without changing jumpers on the card. At the end of the day, making it work without any changes to the card is easy enough that I would suggest tinkering with the cable instead of the card.

During initial testing, using a cable with a twist but only using the connector prior to the twist is a good way to get a single drive initially working with minimal effort.


Unmodified, the typical 3.5" drive rotates at 300 RPM. This is also the speed of most 5.25" drives.

