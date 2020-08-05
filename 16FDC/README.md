# 16FDC Disk Controller Card

The 16FDC card includes a disk controller capable of directly selecting up to four drive (which would typically have beeen 8" or 5.25" drives) up to Dual Density/Double Sided (DD/DS) capacity.

It also includes a serial port, a ROM that can contain RDOS, and simple memory bank-select logic that maps out the ROM once Bank 0 RAM (on another card) has been selected. (A reset from the reset switch will map the ROM back in and take the user to BDOS.)

For 34 conductor ribbon cables, the controller is designed for use with cables that are "straight through" and will NOT work with cables that have the "twist" commonly found on PC floppy cables. These cables can be a bit challenging to locate, but one with a twist can serve as a starting point if you cut the cable before the twist.

As you go through this, if you try to get a 3.5" drive working, I would suggest getting a dual-drive cable for a PC and then just cutting it off beyond the connector that is usually for the B: drive. It can be a bit confussing, but the default floppy drives for a PC are typically strapped to be the B: drive. It is the "twist" that changes the drive select and the motor control for the A: drive into the positions they need to be for a drive that is strapped for B:. There is only a single motor control line on the 16FDC, so a cable with the twist will not work without changing jumpers on the card. At the end of the day, making it work without any changes to the card is easy enough that I would suggest tinkering with the cable instead of the card.

For a while, I worked with the Tandom TM100 5.25" DD/DS drives that were installed in my Cromemco Z-2D. Knowing what I know now, if I was starting over and didn't have any 5.25" disks I wanted to retrieve the contents of, I would start with 3.5" drives. Most of this is a "walk through" of how I would suggest going about getting a system running.

The beginning of everything is making sure you can get to RDOS and that you are running v2.51. When you power the system up, press the enter key on the serial terminal a few times. You should see a message...

WORK IN PROGRESS

Unmodified, the typical 3.5" drive rotates at 300 RPM. This is also the speed of most 5.25" drives.

