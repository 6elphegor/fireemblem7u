	.include "macro.inc"

	.syntax unified

	thumb_func_start RenderMap
RenderMap: @ 0x08019504
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r0, _08019578 @ =0x0202BBB8
	ldrh r2, [r0, #0xc]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x14
	strh r1, [r0, #0x24]
	ldrh r2, [r0, #0xe]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x14
	strh r1, [r0, #0x26]
	movs r5, #9
	adds r7, r0, #0
_0801951E:
	movs r4, #0xe
	subs r6, r5, #1
_08019522:
	movs r0, #0x24
	ldrsh r3, [r7, r0]
	adds r3, r3, r4
	movs r1, #0x26
	ldrsh r0, [r7, r1]
	adds r0, r0, r5
	str r0, [sp]
	ldr r0, _0801957C @ =0x02024460
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutMapMetatile
	subs r4, #1
	cmp r4, #0
	bge _08019522
	adds r5, r6, #0
	cmp r5, #0
	bge _0801951E
	movs r0, #8
	bl EnableBgSync
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, _08019580 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019578: .4byte 0x0202BBB8
_0801957C: .4byte 0x02024460
_08019580: .4byte 0x03002870
