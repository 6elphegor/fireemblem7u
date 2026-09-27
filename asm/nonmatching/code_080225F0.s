	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080225F0
sub_080225F0: @ 0x080225F0
	push {lr}
	ldr r0, _08022614 @ =0x03004690
	ldr r0, [r0]
	ldr r1, _08022618 @ =0x0203A85C
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	bne _0802261C
	movs r0, #1
	b _0802261E
	.align 2, 0
_08022614: .4byte 0x03004690
_08022618: .4byte 0x0203A85C
_0802261C:
	movs r0, #2
_0802261E:
	pop {r1}
	bx r1
	.align 2, 0
