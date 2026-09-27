	.include "macro.inc"

	.syntax unified

	thumb_func_start Copy2dChr
Copy2dChr: @ 0x08013238
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	lsls r4, r2, #5
	cmp r3, #0
	ble _08013268
	adds r5, r3, #0
_08013246:
	adds r2, r4, #0
	cmp r4, #0
	bge _0801324E
	adds r2, r4, #3
_0801324E:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r7, #0
	adds r1, r6, #0
	bl CpuFastSet
	adds r7, r7, r4
	movs r0, #0x80
	lsls r0, r0, #3
	adds r6, r6, r0
	subs r5, #1
	cmp r5, #0
	bne _08013246
_08013268:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
