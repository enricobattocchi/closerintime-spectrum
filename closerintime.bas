   1 BORDER 0: PAPER 0: INK 7: CLS : GO TO 100
   2 REM *** CLOSER IN TIME ***
   3 REM *** ZX Spectrum Edition ***
   4 REM Based on closerintime.com
  10 REM === DATA: 50 events ===
  11 REM Format: name$, year
  12 DATA "Venus of Willendorf",-28000
  13 DATA "Gobekli Tepe",-9600
  14 DATA "Great Pyramid of Giza",-2560
  15 DATA "Stonehenge",-2500
  16 DATA "The Trojan War",-1180
  17 DATA "Homer's Iliad",-800
  18 DATA "First ancient Olympics",-776
  19 DATA "Founding of Rome",-753
  20 DATA "Battle of Marathon",-490
  21 DATA "Trial of Socrates",-399
  22 DATA "Death of Alexander",-323
  23 DATA "Death of Archimedes",-212
  24 DATA "Cleopatra's death",-30
  25 DATA "Destruction of Pompeii",79
  26 DATA "The Colosseum completed",80
  27 DATA "Pantheon in Rome",125
  28 DATA "First Council of Nicaea",325
  29 DATA "End of W. Roman Empire",476
  30 DATA "Coronation of Charlemagne",800
  31 DATA "Battle of Hastings",1066
  32 DATA "Magna Carta",1215
  33 DATA "Dante's Divine Comedy",1321
  34 DATA "The Black Death",1348
  35 DATA "Gutenberg Bible",1453
  36 DATA "Columbus to America",1492
  37 DATA "Mona Lisa by Da Vinci",1506
  38 DATA "First circumnavigation",1522
  39 DATA "Death of Shakespeare",1616
  40 DATA "Great Fire of London",1666
  41 DATA "Newton's Principia",1687
  42 DATA "Declaration of Independ.",1776
  43 DATA "Storming the Bastille",1789
  44 DATA "Battle of Waterloo",1815
  45 DATA "Darwin's Origin of Spp.",1859
  46 DATA "Construction of Eiffel T.",1889
  47 DATA "Wright brothers' flight",1903
  48 DATA "Sinking of the Titanic",1912
  49 DATA "Einstein's relativity",1915
  50 DATA "Wall Street Crash",1929
  51 DATA "Invasion of Poland",1939
  52 DATA "Atomic bomb on Hiroshima",1945
  53 DATA "First man in space",1961
  54 DATA "First man on the Moon",1969
  55 DATA "Release of ZX Spectrum",1982
  56 DATA "Fall of the Berlin Wall",1989
  57 DATA "The first website",1990
  58 DATA "9/11 attacks",2001
  59 DATA "Launch of the iPhone",2007
  60 DATA "COVID-19 pandemic",2020
  61 DATA "Release of ChatGPT",2022
  99 REM
 100 REM === INITIALISATION ===
 101 LET ne=50: LET cy=2026
 102 DIM e$(ne,26): DIM y(ne)
 103 DIM s(3): DIM c(3)
 104 LET ns=0
 105 FOR i=1 TO ne
 106 READ e$(i),y(i)
 107 NEXT i
 108 REM s()=selected indices
 109 REM c()=ink colours for markers
 110 LET c(1)=6: LET c(2)=5: LET c(3)=3
 199 REM
 200 REM === TITLE SCREEN ===
 201 BORDER 0: PAPER 0: INK 7: CLS
 202 PRINT AT 2,0; INK 2;"_______________________________"
 210 PRINT AT 4,9; INK 6; BRIGHT 1;"CLOSER IN TIME"
 211 PRINT AT 5,9; INK 6;"~~~~~~~~~~~~~~"
 220 PRINT AT 8,2; INK 7;"Which historical events are"
 221 PRINT AT 9,2; INK 7;"closer in time to each other?"
 230 PRINT AT 12,1; INK 5;"Select 2 or 3 events and see"
 231 PRINT AT 13,1; INK 5;"them on a timeline."
 240 PRINT AT 16,3; INK 4;"Based on closerinti.me"
 250 PRINT AT 18,0; INK 2;"_______________________________"
 260 PRINT AT 21,4; INK 6; FLASH 1;"Press any key to start"
 270 PAUSE 0
 299 REM
 300 REM === EVENT SELECTION ===
 301 CLS
 302 LET ns=0
 303 LET top=1: LET cur=1: LET oc=1: LET ot=1
 304 LET pg=16: REM visible rows
 310 REM -- Draw full screen once --
 311 GO SUB 350
 315 REM -- Input loop --
 316 LET k$=INKEY$
 317 IF k$="" THEN GO TO 316
 318 LET oc=cur: LET ot=top
 319 IF k$="q" OR k$="Q" OR k$="7" THEN GO SUB 335
 320 IF k$="a" OR k$="A" OR k$="6" THEN GO SUB 340
 321 IF k$=" " THEN GO SUB 400: GO SUB 395: GO TO 316
 322 IF k$="g" OR k$="G" THEN IF ns>=2 THEN GO TO 500
 325 IF top<>ot THEN GO SUB 350: GO TO 332
 326 IF cur<>oc THEN GO SUB 390
 330 GO TO 316
 332 IF INKEY$<>"" THEN GO TO 332
 333 GO TO 316
 335 REM -- Move up --
 336 IF cur>1 THEN LET cur=cur-1
 337 IF cur<top THEN LET top=top-pg: IF top<1 THEN LET top=1
 339 RETURN
 340 REM -- Move down --
 341 IF cur<ne THEN LET cur=cur+1
 342 IF cur>=top+pg THEN LET top=top+pg: IF top>ne-pg+1 THEN LET top=ne-pg+1
 345 RETURN
 349 REM
 350 REM -- Draw full event list --
 351 PRINT AT 0,0; INK 6; BRIGHT 1;" CLOSER IN TIME";
 352 PRINT INK 7;"  Sel:";ns;"/3 "
 353 PRINT AT 1,0; INK 2;"_______________________________"
 354 FOR i=0 TO pg-1
 355 LET idx=top+i: GO SUB 365
 356 NEXT i
 357 PRINT AT pg+2,0; PAPER 0; INK 2;"_______________________________"
 358 PRINT AT pg+3,0; INK 5;"Q"; INK 7;"/"; INK 5;"A"; INK 7;" Move  "; INK 5;"SPACE"; INK 7;" Select"
 359 IF ns>=2 THEN PRINT AT pg+4,0; INK 6; BRIGHT 1;"G"; INK 7;" = Show timeline!    ": RETURN
 360 PRINT AT pg+4,0; INK 7;"Select ";2-ns;" more event  ": RETURN
 365 REM -- Draw single row (i=row, idx=event) --
 366 IF idx>ne THEN PRINT AT i+2,0;"                                ": RETURN
 367 LET sel=0: LET bg=0
 368 IF ns>0 THEN IF s(1)=idx THEN LET sel=1
 369 IF ns>1 THEN IF s(2)=idx THEN LET sel=2
 370 IF ns>2 THEN IF s(3)=idx THEN LET sel=3
 371 IF idx=cur THEN LET bg=1
 372 IF sel>0 THEN PRINT AT i+2,0; PAPER bg; INK c(sel); BRIGHT 1;CHR$ 143;" ";: GO TO 375
 373 PRINT AT i+2,0; PAPER bg; INK 7;"  ";
 375 LET yr=y(idx)
 376 IF yr<0 THEN PRINT PAPER bg; INK 4;-yr; INK 7;"BC ";e$(idx)( TO 16);"  ": RETURN
 377 PRINT PAPER bg; INK 4;yr; INK 7;" ";e$(idx)( TO 19);" "
 378 RETURN
 390 REM -- Update 2 rows (old+new cursor) --
 391 LET i=oc-top: LET idx=oc: GO SUB 365
 392 LET i=cur-top: LET idx=cur: GO SUB 365
 393 RETURN
 395 REM -- Update header + current row --
 396 PRINT AT 0,17; INK 7;"Sel:";ns;"/3 "
 397 LET i=cur-top: LET idx=cur: GO SUB 365
 398 IF ns>=2 THEN PRINT AT pg+4,0; INK 6; BRIGHT 1;"G"; INK 7;" = Show timeline!    ": RETURN
 399 PRINT AT pg+4,0; INK 7;"Select ";2-ns;" more event  ": RETURN
 400 REM === TOGGLE SELECTION ===
 401 REM Check if already selected
 402 LET found=0
 403 FOR j=1 TO ns
 404 IF s(j)=cur THEN LET found=j
 405 NEXT j
 406 IF found>0 THEN GO TO 420
 407 REM Not selected - add it
 408 IF ns>=3 THEN BEEP 0.1,0: RETURN
 409 LET ns=ns+1
 410 LET s(ns)=cur
 411 BEEP 0.05,20
 412 RETURN
 420 REM Already selected - remove it
 421 FOR k=found TO ns-1
 422 LET s(k)=s(k+1)
 423 NEXT k
 424 LET s(ns)=0
 425 LET ns=ns-1
 426 BEEP 0.05,10
 427 RETURN
 499 REM
 500 REM === SORT SELECTED BY YEAR ===
 501 REM Bubble sort selected events
 502 FOR i=1 TO ns-1
 503 FOR j=1 TO ns-i
 504 IF y(s(j))>y(s(j+1)) THEN LET tmp=s(j): LET s(j)=s(j+1): LET s(j+1)=tmp
 505 NEXT j
 506 NEXT i
 510 REM
 520 REM === CALCULATE TIMELINE ===
 521 LET oldest=y(s(1))
 522 LET span=cy-oldest
 523 IF span=0 THEN LET span=1
 530 REM Calculate positions (0-28)
 531 DIM p(3)
 532 FOR i=1 TO ns
 533 LET p(i)=INT(((y(s(i))-oldest)/span)*28)
 534 NEXT i
 599 REM
 600 REM === DRAW TIMELINE SCREEN ===
 601 CLS
 602 PRINT AT 0,1; INK 6; BRIGHT 1;"CLOSER IN TIME"
 603 PRINT AT 1,0; INK 2;"_______________________________"
 610 REM -- Draw event labels above --
 611 FOR i=1 TO ns
 612 LET x=p(i)+2
 613 IF x>29 THEN LET x=29
 614 PRINT AT 3+(i-1)*2,0; INK c(i); BRIGHT 1;e$(s(i))
 615 LET yr=y(s(i))
 616 IF yr<0 THEN PRINT AT 4+(i-1)*2,1; INK c(i);"(";-yr;" BC)": GO TO 618
 617 PRINT AT 4+(i-1)*2,1; INK c(i);"(";yr;")"
 618 NEXT i
 620 REM -- The timeline bar --
 621 LET tr=10: REM timeline row
 622 REM Draw base bar
 623 FOR x=2 TO 29
 624 PRINT AT tr,x; INK 7;CHR$ 143
 625 NEXT x
 630 REM Draw coloured segments
 631 REM First segment: start to event 1
 632 REM Between events: coloured
 633 REM Last segment to NOW
 635 REM Colour segment from each event to next
 636 FOR m=1 TO ns
 637 LET sstart=p(m)+2
 638 IF m<ns THEN LET send=p(m+1)+2: GO TO 640
 639 LET send=29: REM last event to end
 640 FOR x=sstart TO send
 641 PRINT AT tr,x; INK c(m); BRIGHT 1;CHR$ 143
 642 NEXT x
 643 NEXT m
 650 REM Draw markers
 651 FOR i=1 TO ns
 652 LET x=p(i)+2
 653 PRINT AT tr-1,x; INK c(i); BRIGHT 1;"v"
 654 PRINT AT tr,x; INK 0; PAPER c(i); BRIGHT 1;CHR$ 143
 655 NEXT i
 656 REM Draw NOW marker
 657 PRINT AT tr-1,29; INK 2; BRIGHT 1;"v"
 658 PRINT AT tr,29; INK 7; PAPER 2; BRIGHT 1;"N"
 659 PRINT AT tr+1,28; INK 2;"NOW"
 660 REM Draw start year
 661 LET yr=y(s(1))
 662 IF yr<0 THEN PRINT AT tr+1,1; INK 4;-yr;"BC": GO TO 664
 663 PRINT AT tr+1,1; INK 4;yr
 664 REM
 700 REM === GENERATE SENTENCE ===
 701 LET sr=13: REM sentence row
 702 PRINT AT sr-1,0; INK 2;"_______________________________"
 710 IF ns=2 THEN GO TO 730
 720 IF ns=3 THEN GO TO 770
 725 GO TO 800
 730 REM -- 2-event sentence --
 731 LET d1=y(s(2))-y(s(1))
 732 LET d2=cy-y(s(2))
 733 IF d1<0 THEN LET d1=-d1
 734 IF d2<0 THEN LET d2=-d2
 736 IF d2<d1 THEN GO TO 740
 737 IF d2>d1 THEN GO TO 750
 738 GO TO 760
 740 REM closer to us
 741 PRINT AT sr,0; INK 6;e$(s(2))
 742 PRINT AT sr+1,0; INK 6;"is closer to "; INK 2;"us"; INK 6;" than to"
 743 PRINT AT sr+2,0; INK 6;e$(s(1))
 744 GO TO 765
 750 REM closer to event
 751 PRINT AT sr,0; INK 6;e$(s(2))
 752 PRINT AT sr+1,0; INK 6;"is closer to"
 753 PRINT AT sr+2,0; INK 6;e$(s(1))
 754 PRINT AT sr+3,0; INK 6;"than to "; INK 2;"us"
 755 GO TO 765
 760 REM exactly halfway
 761 PRINT AT sr,0; INK 6;e$(s(2))
 762 PRINT AT sr+1,0; INK 6;"is exactly halfway between"
 763 PRINT AT sr+2,0; INK 6;e$(s(1))
 764 PRINT AT sr+3,0; INK 6;"and "; INK 2;"us"
 765 PRINT AT 19,0; INK 4;"(";d1;" vs ";d2;" years)"
 767 GO TO 800
 770 REM -- 3-event sentence --
 771 LET d1=y(s(2))-y(s(1))
 772 LET d2=cy-y(s(3))
 773 IF d1<0 THEN LET d1=-d1
 774 IF d2<0 THEN LET d2=-d2
 775 IF d1>d2 THEN GO TO 780
 776 IF d2>d1 THEN GO TO 787
 777 GO TO 794
 780 PRINT AT sr,0; INK 6;"More time between"
 781 PRINT AT sr+1,0; INK 5;e$(s(1))
 782 PRINT AT sr+2,0; INK 6;"and "; INK 5;e$(s(2))
 783 PRINT AT sr+3,0; INK 6;"than between"
 784 PRINT AT sr+4,0; INK 3;e$(s(3))
 785 PRINT AT sr+5,0; INK 6;"and "; INK 2;"us"
 786 GO TO 799
 787 PRINT AT sr,0; INK 6;"More time between"
 788 PRINT AT sr+1,0; INK 3;e$(s(3))
 789 PRINT AT sr+2,0; INK 6;"and "; INK 2;"us"
 790 PRINT AT sr+3,0; INK 6;"than between"
 791 PRINT AT sr+4,0; INK 5;e$(s(1))
 792 PRINT AT sr+5,0; INK 6;"and "; INK 5;e$(s(2))
 793 GO TO 799
 794 PRINT AT sr,0; INK 6;"Same time between"
 795 PRINT AT sr+1,0; INK 5;e$(s(1))
 796 PRINT AT sr+2,0; INK 6;"and "; INK 5;e$(s(2))
 797 PRINT AT sr+3,0; INK 6;"as between"
 798 PRINT AT sr+4,0; INK 3;e$(s(3))
 799 PRINT AT 19,0; INK 4;"(";d1;" vs ";d2;" years)"
 800 REM === PLAY AGAIN? ===
 801 PRINT AT 20,0; INK 2;"_______________________________"
 802 PRINT AT 21,0; INK 6;"Press any key to try again"
 810 PAUSE 0
 811 GO TO 300
