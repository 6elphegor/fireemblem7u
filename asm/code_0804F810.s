	.include "macro.inc"

	.syntax unified

	thumb_func_start SetUnitEfxDebuff
SetUnitEfxDebuff: @ 0x0804F810
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, _0804F83C @ =0x0201776C
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	str r5, [r0, #0x4c]
	cmp r5, #0
	bne _0804F834
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl EfxStatusUnitFlashing
_0804F834:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804F83C: .4byte 0x0201776C
