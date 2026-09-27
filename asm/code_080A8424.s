	.include "macro.inc"

	.syntax unified

	thumb_func_start ModeSelect_RotateRight
ModeSelect_RotateRight: @ 0x080A8424
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x34]
	movs r0, #0
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x3c]
	bl StartFaceFadeOut
	adds r1, r4, #0
	adds r1, #0x41
	ldrb r0, [r1]
	cmp r0, #0
	bne _080A8448
	adds r0, r4, #0
	adds r0, #0x4c
	ldrb r0, [r0]
_080A8448:
	subs r0, #1
	strb r0, [r1]
	bl sub_080A7C4C
	adds r2, r4, #0
	adds r2, #0x41
	ldrb r3, [r2]
	adds r1, r3, #0
	muls r1, r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	subs r0, r0, r1
	lsls r0, r0, #4
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r2, [r2]
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_080A8150
	ldrh r0, [r4, #0x32]
	ldrh r1, [r4, #0x30]
	cmp r0, r1
	bhs _080A8486
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r0, r3
	strh r0, [r4, #0x32]
_080A8486:
	pop {r4}
	pop {r0}
	bx r0
