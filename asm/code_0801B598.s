	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801B598
sub_0801B598: @ 0x0801B598
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r1, #0
	ldr r0, _0801B60C @ =0x081C3B80
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _0801B610 @ =0x08B9333C
	bl Proc_Find
	adds r4, r0, #0
	adds r5, r6, #0
	adds r5, #0x34
	adds r0, r5, #0
	bl ClearText
	ldr r0, _0801B614 @ =0x00001247
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertDrawString
	adds r4, #0x66
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x40
	movs r2, #2
	bl Text_InsertDrawString
	movs r2, #0x2c
	ldrsh r1, [r6, r2]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r6, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801B618 @ =0x02022C60
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801B60C: .4byte 0x081C3B80
_0801B610: .4byte 0x08B9333C
_0801B614: .4byte 0x00001247
_0801B618: .4byte 0x02022C60
