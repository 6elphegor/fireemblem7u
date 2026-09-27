	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragonTmCpyHFlip
EkrDragonTmCpyHFlip: @ 0x08064AEC
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	bl CheckInEkrDragon
	cmp r0, #0
	beq _08064B28
	asrs r2, r4, #3
	asrs r4, r5, #3
	ldr r0, _08064B30 @ =0x02019784
	movs r1, #1
	rsbs r1, r1, #0
	lsls r2, r2, #1
	lsls r3, r4, #5
	adds r3, r3, r4
	lsls r3, r3, #2
	ldr r4, _08064B34 @ =0x0201D41C
	adds r3, r3, r4
	adds r2, r2, r3
	movs r3, #0x20
	str r3, [sp]
	str r3, [sp, #4]
	movs r3, #6
	str r3, [sp, #8]
	movs r3, #0
	str r3, [sp, #0xc]
	movs r3, #0x42
	bl EfxTmCpyExtHFlip
_08064B28:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064B30: .4byte 0x02019784
_08064B34: .4byte 0x0201D41C
