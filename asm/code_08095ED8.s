	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08095ED8
sub_08095ED8: @ 0x08095ED8
	ldr r0, _08095F0C @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _08095EE8
	movs r2, #0
_08095EE8:
	cmp r2, #0xc
	bne _08095EF8
	ldr r1, _08095F10 @ =0x04000050
	movs r0, #0xc8
	strh r0, [r1]
	adds r1, #4
	movs r0, #8
	strh r0, [r1]
_08095EF8:
	cmp r2, #0x34
	beq _08095F00
	cmp r2, #0
	bne _08095F0A
_08095F00:
	ldr r0, _08095F10 @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
_08095F0A:
	bx lr
	.align 2, 0
_08095F0C: .4byte 0x04000006
_08095F10: .4byte 0x04000050
