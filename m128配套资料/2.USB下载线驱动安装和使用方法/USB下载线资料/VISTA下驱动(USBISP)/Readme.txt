

                         LOWBULK.SYS and LOWCDC.SYS


    This is the Readme file about patch drivers for using low-speed CDC
    protocol on Windows. For more information please visit
    http://www.recursion.jp/avrcdc/lowbulk.html
    http://www.recursion.jp/avrcdc/lowcdc.html


SUMMARY
=======
    The lowbulk.sys performs the CDC (Communication Device Class) connection
    over low-speed USB on Windows Vista. It is a tiny filter driver to enable
    bulk transfer on low-speed devices. It resides between "usbser.sys" and the
    USB port driver, and it helps configuring bulk pipes for low-speed device
    when connected. It just passes through the packets between the layers at
    other times.
    
    The lowcdc.sys performs the CDC connection over the low-speed interrupt
    transfer on Windows.
    
    The lowbulk.sys and the lowcdc.sys are developed by Osamu Tamura.


SPECIFICATION
=============
  (lowbulk.sys)
    Platform:   Windows Vista (32bit). It works with "usbser.sys".
    Function:   Configuring the bulk endpoints on low-speed devices.
    Structure:  Kernel mode driver
    Size:       5,632 bytes
    
    This patch works as follows:
      Step 1. Configures the interrupt pipes instead of bulk pipes.
      Step 2. Reforms the interrupt pipes to the bulk pipes after the endpoints
              were generated.

  (lowcdc.sys)
    Platform:   Windows XP/Vista (32bit). It works with "usbser.sys".
    Function:   Configures the interrupt endpoints for the CDC protocol.
    Structure:  Kernel mode driver
    Size:       5,632 bytes
    
    This patch works as follows:
      Step 1. Configures the interrupt pipes instead of bulk pipes.
      Step 2. Reports the created pipes as the bulk to usbser.sys.

    This driver is designed for AVR-CDC, and may not work properly on other
    "low-speed bulk" devices.

    CDC on low-speed USB is not allowed by the USB standard. Use low***.sys at
    your own risk. 


USAGE
=====
    Install the virtual COM/CDC protocol interface driver.
        Connect AVR-CDC device and follow the dialog instructions.
        Indicate "inf/vista/" folder to install "usbser.sys" and "lowbulk.sys",
        or indicate "inf/lowcdc/" to install "usbser.sys" and "lowcdc.sys".

        /inf -- /vista  -- lowbulk.inf  <= setup file for Windows Vista
                        -- lowbulk.sys
             -- /xp2k   -- avrcdc.inf   <= setup file for Windows 2000/XP

             -- /lowcdc -- lowcdc.inf   <= setup file for Windows 2000/XP/Vista
                        -- lowcdc.sys        (interrupt transfer mode)


DEVELOPMENT
===========
    This driver has been developed on WinDDK 6001.18001 and was based on the
    sample (src/general/toaster/filter/devlower).
    Copy the source code into /src and build it under the WinDDK environment.


USING lowbulk.sys FOR FREE
======================
    The low***.sys is published under an Open Source compliant license.
    See the file "License.txt" for details.


    Osamu Tamura @ Recursion Co., Ltd.
    http://www.recursion.jp/avrcdc/lowbulk.html
    15 July 2008
    02 February 2009

