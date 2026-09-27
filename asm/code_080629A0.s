	.include "macro.inc"

	.syntax unified

	thumb_func_start efxYushaSpinShieldOBJ_806CE08
efxYushaSpinShieldOBJ_806CE08: @ 0x080629A0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _080629C2
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_080629C2:
	pop {r4}
	pop {r0}
	bx r0
