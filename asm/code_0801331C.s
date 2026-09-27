	.include "macro.inc"

	.syntax unified

	thumb_func_start PutAppliedBitmap
PutAppliedBitmap: @ 0x0801331C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	movs r0, #0
	cmp r0, r3
	bge _08013348
_0801332A:
	adds r2, r0, #1
	cmp r5, #0
	ble _08013342
	lsls r0, r0, #6
	adds r0, r0, r6
	adds r1, r5, #0
_08013336:
	strh r4, [r0]
	adds r4, #1
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bne _08013336
_08013342:
	adds r0, r2, #0
	cmp r0, r3
	blt _0801332A
_08013348:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
