	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBanimInitPosReal
GetBanimInitPosReal: @ 0x0804D43C
	push {r4, r5, lr}
	ldr r0, _0804D454 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _0804D47C
	lsls r0, r0, #2
	ldr r1, _0804D458 @ =_0804D45C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804D454: .4byte 0x0203E02C
_0804D458: .4byte _0804D45C
_0804D45C: @ jump table
	.4byte _0804D4C4 @ case 0
	.4byte _0804D470 @ case 1
	.4byte _0804D47C @ case 2
	.4byte _0804D4C4 @ case 3
	.4byte _0804D4C4 @ case 4
_0804D470:
	ldr r0, _0804D478 @ =0x0203E00C
	movs r2, #0
	ldrsh r0, [r0, r2]
	b _0804D4C6
	.align 2, 0
_0804D478: .4byte 0x0203E00C
_0804D47C:
	movs r1, #0
	movs r5, #0
	ldr r0, _0804D4AC @ =0x0203E008
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0804D4A4
	ldr r4, _0804D4B0 @ =0x0203E09C
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl CheckBattleTalk
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	ldrb r0, [r4, #1]
	ldrb r1, [r4]
	bl CheckBattleTalk
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
_0804D4A4:
	cmp r5, #1
	bne _0804D4B4
	movs r0, #0
	b _0804D4C6
	.align 2, 0
_0804D4AC: .4byte 0x0203E008
_0804D4B0: .4byte 0x0203E09C
_0804D4B4:
	cmp r1, #1
	beq _0804D4C4
	ldr r0, _0804D4C0 @ =0x0203E00C
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _0804D4C6
	.align 2, 0
_0804D4C0: .4byte 0x0203E00C
_0804D4C4:
	movs r0, #1
_0804D4C6:
	pop {r4, r5}
	pop {r1}
	bx r1
