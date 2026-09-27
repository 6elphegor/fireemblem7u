	.include "macro.inc"

	.syntax unified

	thumb_func_start DeadDragonFlame_Rotation
DeadDragonFlame_Rotation: @ 0x0807B910
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r4, r0, #0x12
	ldr r2, _0807B948 @ =0x03002870
	adds r3, r2, #0
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r3, r2, #0
	cmp r4, #6
	bgt _0807B94C
	movs r0, #0x10
	subs r1, r0, r4
	b _0807B94E
	.align 2, 0
_0807B948: .4byte 0x03002870
_0807B94C:
	movs r1, #0xa
_0807B94E:
	adds r0, r3, #0
	adds r0, #0x45
	movs r3, #0
	strb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x46
	strb r3, [r0]
	cmp r4, #0x10
	bne _0807B96C
	adds r0, r5, #0
	adds r0, #0x4c
	strh r3, [r0]
	adds r0, r5, #0
	bl Proc_Break
_0807B96C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
