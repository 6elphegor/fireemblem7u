	.include "macro.inc"

	.syntax unified

	thumb_func_start DragonFlamefx_RefrainBlendAlpha
DragonFlamefx_RefrainBlendAlpha: @ 0x0807B528
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	adds r2, #1
	movs r4, #0
	strh r2, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x11
	ldr r0, _0807B574 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x44
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r4, [r0]
	cmp r2, #0x10
	bne _0807B56E
	adds r0, r5, #0
	bl Proc_Break
_0807B56E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B574: .4byte 0x03002870
