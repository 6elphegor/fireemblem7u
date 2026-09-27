	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplyBitmap
ApplyBitmap: @ 0x08013270
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	cmp r3, #0
	ble _080132A0
	lsls r0, r7, #6
	mov sb, r0
	adds r4, r3, #0
	lsls r0, r7, #5
	mov r8, r0
_0801328C:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl ApplyBitmapLine
	add r6, sb
	add r5, r8
	subs r4, #1
	cmp r4, #0
	bne _0801328C
_080132A0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
