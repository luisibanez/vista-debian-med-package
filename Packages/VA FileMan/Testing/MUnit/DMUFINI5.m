DMUFINI5 ; ; 10-JAN-2013 ; 1/27/13 3:48pm
 ;;22.2;VA FILEMAN;;Mar 28, 2013
 ;Per VHA Directive 2004-038, this routine should not be modified.
 K ^UTILITY("DIF",$J) S DIFRDIFI=1 F I=1:1:4 S ^UTILITY("DIF",$J,DIFRDIFI)=$T(IXF+I),DIFRDIFI=DIFRDIFI+1
 Q
IXF ;;FILEMAN EXTENSIONS FILES^DMUF
 ;;1009.801;BROKEN FILE;^DMU(1009.801,;0;y;y;;n;;;y;o;n
 ;;
 ;;1009.802;SHADOW STATE;^DMU(1009.802,;0;y;y;;n;;;y;o;n
 ;;
