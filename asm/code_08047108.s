	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047108
sub_08047108: @ 0x08047108
	ldr r0, _08047134 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r3, _08047138 @ =0x02001188
	cmp r1, #0xa0
	bls _08047120
	ldr r0, _0804713C @ =0x02001180
	ldr r0, [r0]
	str r0, [r3]
	movs r1, #0
_08047120:
	ldr r2, _08047140 @ =0x04000042
	ldr r0, [r3]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r3, [r1]
	lsls r0, r3, #8
	ldrh r1, [r1, #2]
	adds r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_08047134: .4byte 0x04000006
_08047138: .4byte 0x02001188
_0804713C: .4byte 0x02001180
_08047140: .4byte 0x04000042
