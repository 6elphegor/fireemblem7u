	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807C578
sub_0807C578: @ 0x0807C578
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #2
	strh r1, [r0]
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, r1, #0
	cmp r1, #0
	bge _0807C590
	adds r0, #0xf
_0807C590:
	asrs r0, r0, #4
	lsls r0, r0, #4
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	bgt _0807C5B6
	adds r0, r1, #0
	cmp r1, #0
	bge _0807C5A6
	adds r0, r1, #7
_0807C5A6:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x10
	subs r4, r1, r0
	b _0807C5CC
_0807C5B6:
	adds r0, r1, #0
	cmp r1, #0
	bge _0807C5BE
	adds r0, r1, #7
_0807C5BE:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r4, r0, #0
	adds r4, #8
_0807C5CC:
	ldr r3, _0807C610 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r2, #0
	strb r4, [r0]
	asrs r1, r4, #1
	movs r0, #0x10
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	cmp r1, #0x10
	bne _0807C60A
	strh r2, [r0]
	adds r0, r5, #0
	bl Proc_Break
_0807C60A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C610: .4byte 0x03002870
