	.include "macro.inc"

	.syntax unified

	thumb_func_start ModeSelect_RotateLeft
ModeSelect_RotateLeft: @ 0x080A848C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #1
	str r0, [r4, #0x34]
	movs r5, #0
	str r5, [r4, #0x2c]
	ldr r0, [r4, #0x3c]
	bl StartFaceFadeOut
	adds r1, r4, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r4, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bge _080A84B6
	adds r0, r2, #1
	strb r0, [r1]
	b _080A84B8
_080A84B6:
	strb r5, [r1]
_080A84B8:
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
	ldrh r0, [r4, #0x30]
	ldrh r1, [r4, #0x32]
	cmp r1, r0
	bls _080A84F2
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r0, r3
	strh r0, [r4, #0x30]
_080A84F2:
	pop {r4, r5}
	pop {r0}
	bx r0
