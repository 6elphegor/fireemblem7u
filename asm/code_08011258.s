	.include "macro.inc"

	.syntax unified

	thumb_func_start EventSnowStormfx_Loop2
EventSnowStormfx_Loop2: @ 0x08011258
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	cmp r0, r1
	blt _08011272
	movs r0, #0
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl Proc_Break
_08011272:
	ldr r3, [r4, #0x34]
	lsls r0, r3, #1
	adds r0, r0, r3
	ldr r1, [r4, #0x3c]
	adds r1, r1, r0
	str r1, [r4, #0x3c]
	ldr r2, [r4, #0x40]
	adds r2, r2, r3
	str r2, [r4, #0x40]
	asrs r1, r1, #5
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	asrs r2, r2, #5
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
