	   LXI H,F000
	   MOV A,M
	   RAR
	   MOV C,A
	   INX H

BACK:	   MOV A,M
	   INX H
	   CMP M
	   JC SKIP
	   MOV B,M
	   MOV M,A
	   DCX H
	   MOV M,B
	   INX H

SKIP:	   INX H
	   DCR C
	   JNZ BACK
	   LXI SP,D000
	   LXI H,C000
	   PUSH H
	   LXI H,F001
	   LXI D,F003
	   MVI B,02
	   MVI C,02
	   MVI A,2F
	   STA FF00
	   CALL MERGE
	   LXI SP,D000
	   LXI H,C004
	   PUSH H
	   LXI H,F005
	   LXI D,F007
	   MVI B,02
	   MVI C,02
	   MVI A,48
	   STA FF00
	   CALL MERGE
	   LXI SP,D000
	   LXI H,F001
	   PUSH H
	   LXI H,C000
	   LXI D,C004
	   MVI B,04
	   MVI C,04
	   MVI A,61
	   STA FF00
	   CALL MERGE
	   HLT

MERGE:	   MOV A,M
	   XCHG
	   CMP M
	   JNC BIG
	   LXI SP,CFFE
	   XTHL
	   MOV M,A
	   INX H
	   XTHL
	   INX D
	   XCHG
	   DCR B
	   JNZ MERGE
	   XCHG

LOOP_B:	   MOV B,M
	   LXI SP,CFFE
	   XTHL
	   MOV M,B
	   INX H
	   XTHL
	   INX H
	   DCR C
	   JNZ LOOP_B
	   MVI H,00
	   LDA FF00
	   MOV L,A
	   XTHL
	   RET

BIG:	   MOV A,M
	   LXI SP,CFFE
	   XTHL
	   MOV M,A
	   INX H
	   XTHL
	   INX H
	   XCHG
	   DCR C
	   JNZ MERGE

LOOP_A:	   MOV C,M
	   LXI SP,CFFE
	   XTHL
	   MOV M,C
	   INX H
	   XTHL
	   INX H
	   DCR B
	   JNZ LOOP_A
	   MVI H,00
	   LDA FF00
	   MOV L,A
	   XTHL
	   RET
