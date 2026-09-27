	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802107C
sub_0802107C: @ 0x0802107C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r5, #0x64
	movs r0, #0
	ldrsh r1, [r5, r0]
	movs r0, #0x10
	subs r4, r0, r1
	cmp r4, #0
	bge _08021090
	movs r4, #0
_08021090:
	ldr r3, _080210D8 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _080210DC @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #0x1f
	orrs r0, r1
	ldr r1, _080210E0 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080210D8: .4byte 0x03002870
_080210DC: .4byte 0x0000FFE0
_080210E0: .4byte 0x0000E0FF
