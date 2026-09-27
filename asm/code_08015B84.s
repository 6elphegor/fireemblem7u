	.include "macro.inc"

	.syntax unified

	thumb_func_start CamMove_OnLoop
CamMove_OnLoop: @ 0x08015B84
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x3c]
	cmp r1, #0
	bne _08015BA4
	ldr r0, _08015BA0 @ =0x0202BBB8
	ldrh r1, [r0, #0xc]
	strh r1, [r5, #0x2c]
	ldrh r0, [r0, #0xe]
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_End
	b _08015BF6
	.align 2, 0
_08015BA0: .4byte 0x0202BBB8
_08015BA4:
	ldr r0, _08015BFC @ =0x0202BC48
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r2, [r5, #0x3a]
	subs r0, r2, r0
	strh r0, [r5, #0x3a]
	subs r0, r1, #1
	str r0, [r5, #0x3c]
	ldr r4, _08015C00 @ =0x0202BBB8
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	movs r2, #0x2c
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	movs r2, #0x3a
	ldrsh r1, [r5, r2]
	muls r0, r1, r0
	movs r2, #0x38
	ldrsh r1, [r5, r2]
	bl __divsi3
	ldrh r1, [r5, #0x2c]
	adds r0, r1, r0
	strh r0, [r4, #0xc]
	movs r2, #0x32
	ldrsh r0, [r5, r2]
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	movs r2, #0x3a
	ldrsh r1, [r5, r2]
	muls r0, r1, r0
	movs r2, #0x38
	ldrsh r1, [r5, r2]
	bl __divsi3
	ldrh r5, [r5, #0x2e]
	adds r0, r5, r0
	strh r0, [r4, #0xe]
_08015BF6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015BFC: .4byte 0x0202BC48
_08015C00: .4byte 0x0202BBB8
