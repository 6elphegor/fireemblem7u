	.include "macro.inc"

	.syntax unified

	thumb_func_start GameOverScreenHBlank
GameOverScreenHBlank: @ 0x080201C8
	push {lr}
	ldr r0, _08020204 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0xa0
	bls _080201DA
	movs r1, #0
_080201DA:
	cmp r1, #0x50
	bls _080201E6
	movs r0, #0xa0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_080201E6:
	adds r0, r1, #0
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x10
	bls _080201F8
	movs r1, #0x10
_080201F8:
	ldr r0, _08020208 @ =0x04000052
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08020204: .4byte 0x04000006
_08020208: .4byte 0x04000052
