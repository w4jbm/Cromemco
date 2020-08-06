# Cromemco 256KZ Memory Card
When looking for a spare memory card for my Cromemco Z-2D, I ended up with a 64KZ with a failed voltage regulator. Basically, that seems to have pretty much fried the card (although I still hope to repair it one day). Looking more, several 256KZ cards were up for auction and at prices lower than the 64KZ. Four times the memory (even if I didn't need it for my work with the Z80) at a lower price seemed like a great opportunity and I bought one of the boards.

And then I figured out why they tended to be cheaper...

The 256KZ can operate either as a banked 8-bit memory card for the Z80 or a contiguous 256K 16-bit memory card for systems with a 68000 processor.

For 8-bit systems IC39, a 256 location (8 bit address), 1 nibble (4 bit) bipolar programmable PROM. To be the base board in a Z80 system, the board is provided with Cromemco P/N 74947. This allows the board to operate as Banks 0, 1, 2, and 3 (each 64K in size). When two 256KZ boards are installed, one must have the PROM replaced with P/N 74948 (for Banks 0, 1, 2, and 3) and the other with P/N 74949 (for Banks 4, 5, and 6). This is needed to coordinate what happens with a bad bank select bit an how Bank 7 (the commond bank) is handled.

It turned out that the board I received had no PROM making it useless in my Z80 system. After some studying of the schematic and information from members of the Cromemco e-mail group, I figured out a way that let me simply strap the memory card so that Bank 0 was always selected and that the upper 32K was enabled as it typically is when Bank 0 was selected. (The lower 32K is always present on the Bank 0 memory card to allow the Z80 to boot-strap bringing up the 68000 system.) Below is a picture of the DIP header with the necessary resistors allowing use of the card:

![Header as PROM replacement](https://raw.githubusercontent.com/w4jbm/Cromemco/master/256KZ/header.jpg)

There is a bit of bodge wire on the board that seems to be factory installed. MikeS on the Cromemco mailing list provided details from the the official bulletin which covers Mod Level 2:

```
Mod Level 1      Reference #              Date Released 10/25/82
-----------------------------------------------------------------------
Change: 1) Add two 1.5 kohm resistors (001-0020): one from pin 4
           to pin 8 of IC38 and one from pin 13 of IC38 to ground
           strip under "C40" (component side).
 
Reason: 1) Allows board to be configured for Extended-Address-Only
           by removing the Bank Select PROM (IC39).  Default
           systems (DPU, CROMIX 20.XX) with multiple 256KZ's can
           now be configured with one board having a PROM and the
           other boards with XADD switches set accordingly.
 
Mod Level 2      Reference #              Date Released 12/20/82
-----------------------------------------------------------------------
Change: 1) Change IC2 from a 74LS169 (010-0144) to a 74S169(010-0304).
        2) Change IC41 from a 74LS03 (010-0067) to a 7438 (010-0192).
        3) Component side: Cut trace from IC20 pin 12 to IC2 pin 9;
           jump IC2 pin 9 to IC41 pin 13.
        4) Bend out pin 7 of IC2 and jump to IC1 pin 12.
        5) Change IC63 from a 74LS00 (010-0069) to a 74S00(010-0036).
        6) Solder side: Cut trace from IC48 pin 6 to IC47 pin 9 and
           jump IC47 pin 10 to IC47 pin 9.
 
Reason: 1-6) Improves drive and timing control of PRDY.
           Improves timing margin of REFRESH clear condition at
           the end of a refresh cycle.
```
The PROM itself is a 74S287. The pinout is as shown below:

![74S287 PROM Pin Out](https://github.com/w4jbm/Cromemco/raw/master/256KZ/74S287_PinOut.jpg)

The hex dump of the 74947 was also provided. Note that with the default PROM, attempts to select Banks 4, 5, and 6 "fail" and, instead, select Bank 0. There is also logic on the board that helps handle Bank 7. As best I can see at this point, it looks like reads from Bank 7 pull data from Bank 0 while writes to Bank 0 go to all available banks. (This is necessary so that banks can be initialized prior to having the processor switch into them.) The default logic and configuration seems to be to have any unused Bank between 1 to 6 default to Bank 0 if there is an attempt to select it or if there is an attempt to select multiple banks at one time.


