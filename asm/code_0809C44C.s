	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809C44C
sub_0809C44C: @ 0x0809C44C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08088A90
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809C462
	adds r0, r4, #0
	bl Proc_Break
	b _0809C488
_0809C462:
	ldr r0, _0809C490 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809C488
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, _0809C494 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809C488
	ldr r0, _0809C498 @ =0x0000038B
	bl m4aSongNumStart
_0809C488:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809C490: .4byte 0x08B857F8
_0809C494: .4byte 0x0202BBF8
_0809C498: .4byte 0x0000038B
