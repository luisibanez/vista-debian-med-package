DMUFI001 ; ; 10-JAN-2013
 ;;22.2;VA FILEMAN;;Mar 28, 2013
 ;Per VHA Directive 2004-038, this routine should not be modified.
 Q:'DIFQ(1009.801)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,999) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^DIC(1009.801,0,"GL")
 ;;=^DMU(1009.801,
 ;;^DIC("B","BROKEN FILE",1009.801)
 ;;=
 ;;^DD(1009.801,0)
 ;;=FIELD^^.06^6
 ;;^DD(1009.801,0,"DT")
 ;;=3130110
 ;;^DD(1009.801,0,"IX","B",1009.801,.01)
 ;;=
 ;;^DD(1009.801,0,"IX","C",1009.801,.02)
 ;;=
 ;;^DD(1009.801,0,"NM","BROKEN FILE")
 ;;=
 ;;^DD(1009.801,.01,0)
 ;;=NAME^RF^^0;1^K:$L(X)>60!($L(X)<3)!'(X'?1P.E) X
 ;;^DD(1009.801,.01,.008,2,0)
 ;;=NAME
 ;;^DD(1009.801,.01,1,0)
 ;;=^.1
 ;;^DD(1009.801,.01,1,1,0)
 ;;=1009.801^B
 ;;^DD(1009.801,.01,1,1,1)
 ;;=S ^DMU(1009.801,"B",$E(X,1,30),DA)=""
 ;;^DD(1009.801,.01,1,1,2)
 ;;=K ^DMU(1009.801,"B",$E(X,1,30),DA)
 ;;^DD(1009.801,.01,3)
 ;;=Answer must be 3-60 characters in length.
 ;;^DD(1009.801,.01,"DT")
 ;;=3130109
 ;;^DD(1009.801,.02,0)
 ;;=POINTER^P.85'^DI(.85,^0;2^Q
 ;;^DD(1009.801,.02,.008,2,0)
 ;;=POINTER
 ;;^DD(1009.801,.02,1,0)
 ;;=^.1
 ;;^DD(1009.801,.02,1,1,0)
 ;;=1009.801^C
 ;;^DD(1009.801,.02,1,1,1)
 ;;=S ^DMU(1009.801,"C",$E(X,1,30),DA)=""
 ;;^DD(1009.801,.02,1,1,2)
 ;;=K ^DMU(1009.801,"C",$E(X,1,30),DA)
 ;;^DD(1009.801,.02,1,1,"DT")
 ;;=3130109
 ;;^DD(1009.801,.02,"DT")
 ;;=3130109
 ;;^DD(1009.801,.03,0)
 ;;=DATE^D^^0;3^S %DT="E" D ^%DT S X=Y K:X<1 X
 ;;^DD(1009.801,.03,.008,2,0)
 ;;=DATUM
 ;;^DD(1009.801,.03,3)
 ;;=(No range limit on date)
 ;;^DD(1009.801,.03,"DT")
 ;;=3130109
 ;;^DD(1009.801,.04,0)
 ;;=SET^S^M:MALE;F:FEMALE;^0;4^Q
 ;;^DD(1009.801,.04,.007,2,0)
 ;;=MANNCHEN;WEIBCHEN
 ;;^DD(1009.801,.04,.008,2,0)
 ;;=SATZ
 ;;^DD(1009.801,.04,"DT")
 ;;=3130109
 ;;^DD(1009.801,.05,0)
 ;;=NUMBER^NJ3,0^^0;5^K:+X'=X!(X>999)!(X<0)!(X?.E1"."1.N) X
 ;;^DD(1009.801,.05,.008,2,0)
 ;;=ANZAHL
 ;;^DD(1009.801,.05,3)
 ;;=Type a number between 0 and 999, 0 decimal digits.
 ;;^DD(1009.801,.05,"DT")
 ;;=3130109
 ;;^DD(1009.801,.06,0)
 ;;=LOOPY OUTPUT TRANSFORM^DOX^^0;6^S %DT="E" D ^%DT S:Y>0 X=Y K:('X&(X'="HELLO WORLD")) X
 ;;^DD(1009.801,.06,.008,2,0)
 ;;=LOOPY AUSGABE UMZUWANDELN
 ;;^DD(1009.801,.06,2)
 ;;=S Y(0)=Y S:Y="HELLO SAM" Y="HELLO WORLD"
 ;;^DD(1009.801,.06,2.1)
 ;;=S:Y="HELLO SAM" Y="HELLO WORLD"
 ;;^DD(1009.801,.06,3)
 ;;=(No range limit on date)
 ;;^DD(1009.801,.06,"DT")
 ;;=3130110
 ;;^UTILITY("KX",$J,"IX",1009.801,1009.801,"D",0)
 ;;=1009.801^D^DATE XREF^R^^F^IR^I^1009.801^^^^^LS
 ;;^UTILITY("KX",$J,"IX",1009.801,1009.801,"D",1)
 ;;=S ^DMU(1009.801,"D",X,DA)=""
 ;;^UTILITY("KX",$J,"IX",1009.801,1009.801,"D",2)
 ;;=K ^DMU(1009.801,"D",X,DA)
 ;;^UTILITY("KX",$J,"IX",1009.801,1009.801,"D",2.5)
 ;;=K ^DMU(1009.801,"D")
 ;;^UTILITY("KX",$J,"IX",1009.801,1009.801,"D",11.1,0)
 ;;=^.114IA^1^1
 ;;^UTILITY("KX",$J,"IX",1009.801,1009.801,"D",11.1,1,0)
 ;;=1^F^1009.801^.03^^1^F
