# Cromemco 16FDC Disk Controller Card

The 16FDC card includes a disk controller capable of directly selecting up to four drive (which would typically have beeen 8" or 5.25" drives) up to Dual Density/Double Sided (DD/DS) capacity.

It also includes a serial port, a ROM that can contain RDOS, and simple memory bank-select logic that maps out the ROM once Bank 0 RAM (on another card) has been selected. (A reset from the reset switch will map the ROM back in and take the user to BDOS.)

I'm documenting this in case I ever need to go through it again and assume that anyone else reading it is probably wanting to get a Cromemco system up and running. Before going any further, I want to recognize that none of this would have been possible without the prior work of Dave Dunfield, Marcus Bennett, and Herb Johnson. I've pulled thing together in one place and filled in a few gaps, but the whole "shoulders of giants" thing definately is true here.

For a while, I worked with the Tandom TM100 5.25" DD/DS drives that were installed in my Cromemco Z-2D. Knowing what I know now, if I was starting over and didn't have any 5.25" disks I wanted to retrieve the contents of, I would start with 3.5" drives. Most of this is a "walk through" of how I would suggest going about getting a system running.

The beginning of everything is making sure you can get to RDOS and that you are running v2.51. When you power the system up, press the enter key on the serial terminal a few times. You should see a message:

`Preparing to boot, ESC to abort`

If you presse the ESCAPE key, you should see the semicolon (";") prompt. Initially it is good to use the Test command by typing "T".

On bootup, the typical Cromemco will have the 16FDC's ROM mapped into memory at C000H. The ZPU card is normally configured to jump to C000H on startup. This is how RDOS gets started. The Cromemco memory cards are usually set to support up to 7 "Banks" each having up to 64K of RAM. On startup, typically Bank 0 will be mapped in with the lower 32K enabled and the upper 32K dissabled.

The "T" command will copy RDOS from C000H into lower memory, use an `OUT 40,1` command to select Bank 0 (which also enables the upper 32K of RAM and maps the ROM out of the memory space), copies RDOS back up to C000H (which is now RAM) and returns control to the RAM copy of RDOS.

At that point it will perform a quick test to determine how much memory is available to the system.

INSERT SAMPLE OUTPUT

As you start working with the disk drives, it is important to begin with a "known good" cable. The cable in my system had been "pinched" and although it looked generally okay visually and even tested okay with an ohmeter, the connector for drive A: would not work. (In fact, the configuration that initially worked for me was to have the A: drive connected to the B: location on the cable.)

For 34 conductor ribbon cables, the controller is designed for use with cables that are "straight through" and will NOT work with cables that have the "twist" commonly found on PC floppy cables. These cables can be a bit challenging to locate, but one with a twist can serve as a starting point if you cut the cable before the twist. (You actually don't have to cut the end off as long as you leave it unconnected, but it will save you any trouble with connecting it when you shouldn't.)  It can be a bit confussing, but the default floppy drives for a PC are typically strapped to be the B: drive. It is the "twist" that changes the drive select and the motor control for the A: drive into the positions they need to be for a drive that is strapped for B:. There is only a single motor control line on the 16FDC, so a cable with the twist will not work without changing jumpers on the card. At the end of the day, making it work without any changes to the card is easy enough that I would suggest tinkering with the cable instead of the card.

The other things you will need to get started is a known-good 3.5" HD (high-density) drive and an adapter for the power connection. (I have a Cromemco Z-2D. On that system, there are regulator boards that step things down to a regulated +5 volt and +12 volt supply. These deliver power through the larger Molex connectors used on 5.25" drives. This needs an adapter to fit with the smaller power plugs used on 3.5" drives. Also, so far as I have found, all modern 3.5" drives seem to only need the +5 volt supply.

Personally, I would dedicated a 3.5" drive for the next few steps and then set it to the side (along with a pair of copies of CDOS) for the future. This particular drive does not need anything special done to it except for strapping it to use Drive Select 0 (DS0) instead of Drive Select 1 (DS1).

The other thing with many modern drives is that they use a surface mount "zero ohm resistor" for things like strapping the drive select option. If you can find an older drive that uses the small shorting blocks to make these settings instead, it will be a bit easier in the long run. Whatever you have, it will be easier at this point if you can strap it to be A: drive (or use Drive Select 0 which may also be labeled DS0).

Finally, you will need to download the 
During initial testing, using a cable with a twist but only using the connector prior to the twist is a good way to get a single drive initially working with minimal effort.

One of the interesting things about RDOS 2.52 and CDOS x.xx is that you can actually boot your system using only a B: (or a C: or a D:) drive. 


Unmodified, the typical 3.5" drive rotates at 300 RPM. This is also the speed of most 5.25" drives.

