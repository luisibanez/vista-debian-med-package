Install CACHE.DAT into Cach�
=================================

**--- These instructions are for Windows environments only ---**

If you have a CACHE.DAT file that was downloaded from an external source (The
VA or OSEHRA) or from a backup, then you can use that file rather than
`importing from the VistA-M repository`_.

The first step in installing the CACHE.DAT  is to stop the Cach� instance
so that the instance will not clobber a process during the copy.

Right click on the Cach� Cube in the taskbar

.. figure:: http://code.osehra.org/content/named/SHA1/d3df0e66-Cache2011Cube.png
   :align: center
   :alt:  Screenshot of Cach� Cube in taskbar.

and select \"Stop Cach�\". This will pop up a window for confirmation.

.. figure:: http://code.osehra.org/content/named/SHA1/71db09bf-CacheShutdownOptions.png
   :align: center
   :alt:  Screenshot of pop up window to stop a Cach� instance.

Select "Shut down" and click \"OK\".  A status window will appear while the
shutdown is happening.  It will disappear and the taskbar Cach� Cube will turn
gray when the instance is down.

.. figure:: http://code.osehra.org/content/named/SHA1/cd2548dc-CacheShutdownStatus.png
   :align: center
   :alt:  Screenshot of shutdown status window

Cach� Cube has turned gray as the instance has been shut down.

.. figure:: http://code.osehra.org/content/named/SHA1/5f18a5fd-CacheCubeDown.png
   :align: center
   :alt:  Screenshot of grayed-out Cach� Cube in taskbar.

At this point, you can take your downloaded CACHE.DAT and copy it into the
directory that has been set up in Cach� for VistA.  If you followed the
InstallCache.rst_ script, it will be \"C:/Intersystems/TryCache/mgr/VistA\".

All that is left is to restart the Cach� instance.  Right-click on the
grayed-out Cach� Cube and click \"Start Cach�\".  A status window will pop up
to signifiy the instance is starting up.

.. figure:: http://code.osehra.org/content/named/SHA1/9bac5fd1-CacheStartupStatus.png
   :align: center
   :alt:  Screenshot of start up status window.

When it disappears and the Cach� Cube is blue, the instance is ready for use
again.

.. _`importing from the VistA-M repository`: ImportCache.rst
.. _InstallCache.rst: InstallCache.rst
