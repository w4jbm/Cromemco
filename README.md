# Cromemco
Various items related to vintage Cromemco systems and software. Several of these were used for testing and diagnostics as I initially brought the system up. I have cleaned them up a bit and kept them here in case they are needed for future troubleshooting.

## CROMRT.ZIP
A copy of Dave Dunfield's too that can be used as a "bootstrap" for creating system disks over the serial link to a Cromemco system running RDOS 2.5x. Tools for initially formating a disk and several images are included. A utility that allows conversion of other disk image formats to "binary" is also included.


## SOTEST.BAS
A program that runs under CP/M on the Cromemco in MBASIC. It prints a test pattern (using the OUT command, so no device driver is needed) to the console or either of the serial ports on a TU-ART card. It assumes the console port is initialized, but will initialize and set the baud rate to 9600 for the TU-ART ports.

I have modified this to use integers and check for a key stroke to make it compatible with BASCOM. It seems to work fine compiled and stays under 2K in size since there is only interger math functions used. I'll admit that 9600 baud with the compiled version seems to move along the screen a lot faster than it does running under the interpreter.


## TUECHO.BAS
A program that runs under CP/M on the Cromemco in MBASIC. It echos input to a TU-ART serial port back out to the port. The port is initialized to 9600 baud, an "activity indicator" (dots on the screen) is shown, and when a carriage return ($13) is entered an additional line feed ($10) is automatically echoed.


## TUTEST.BAS
A program in Cromemco BASIC under CDOS that tests Device B on the TU-ART card. (By default, set at port 0x50.) You can change settings for baud rates and such based on the manual.


## And the fine print...
The copyright for some of these files are held by others and subject to various terms and conditions. I have tried to recognize those involved and have left any notices or attribution in place with the files used.

These are intended for personal use only. Any material will be removed at the request of the copyright holder or those holding other rights to it.

To the extent applicable, any original work herein is:

Copyright 2020 by James McClanahan and made available under the terms of The MIT License.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
