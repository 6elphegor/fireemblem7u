	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080472F4
sub_080472F4: @ 0x080472F4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08047328 @ =0x02001180
	ldr r0, _0804732C @ =0x02000F00
	str r0, [r1]
	ldr r5, _08047330 @ =0x02001184
	ldr r2, _08047334 @ =0xFFFFFD80
	adds r1, r0, r2
	str r1, [r5]
	ldr r1, _08047338 @ =0x02001188
	str r0, [r1]
	bl sub_080133A8
	ldr r0, [r5]
	bl sub_080133A8
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	ldr r0, _0804733C @ =sub_08047108
	bl SetOnHBlankA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08047328: .4byte 0x02001180
_0804732C: .4byte 0x02000F00
_08047330: .4byte 0x02001184
_08047334: .4byte 0xFFFFFD80
_08047338: .4byte 0x02001188
_0804733C: .4byte sub_08047108
