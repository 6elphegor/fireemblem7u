	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B6C14
sub_080B6C14: @ 0x080B6C14
	push {r4, lr}
	ldr r0, _080B6C80 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xa0
	bls _080B6C26
	movs r3, #0
_080B6C26:
	cmp r3, #0x1f
	bhi _080B6C42
	lsrs r2, r3, #1
	ldr r1, _080B6C84 @ =0x04000050
	movs r4, #0xfd
	lsls r4, r4, #6
	adds r0, r4, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #8
	adds r0, r0, r2
	strh r0, [r1]
_080B6C42:
	cmp r3, #0x80
	bls _080B6C62
	movs r1, #0xa0
	subs r1, r1, r3
	asrs r1, r1, #1
	ldr r2, _080B6C84 @ =0x04000050
	movs r4, #0xfd
	lsls r4, r4, #6
	adds r0, r4, #0
	strh r0, [r2]
	adds r2, #2
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r0, r0, r1
	strh r0, [r2]
_080B6C62:
	cmp r3, #0x20
	bne _080B6C7A
	ldr r2, _080B6C84 @ =0x04000050
	ldr r1, _080B6C88 @ =0x030028AC
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrb r3, [r1, #9]
	lsls r0, r3, #8
	ldrb r1, [r1, #8]
	orrs r0, r1
	strh r0, [r2]
_080B6C7A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B6C80: .4byte 0x04000006
_080B6C84: .4byte 0x04000050
_080B6C88: .4byte 0x030028AC
