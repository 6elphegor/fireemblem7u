	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F61C
sub_0800F61C: @ 0x0800F61C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x5e
	movs r0, #4
	ldrh r1, [r5]
	ands r0, r1
	cmp r0, #0
	beq _0800F632
	movs r0, #0
	b _0800F650
_0800F632:
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl sub_080B4FE4
	ldr r0, _0800F658 @ =EventEndTalk
	str r0, [r4, #0x40]
	movs r0, #0x80
	ldrh r5, [r5]
	ands r0, r5
	cmp r0, #0
	beq _0800F64E
	movs r0, #4
	bl SetTalkFlag
_0800F64E:
	movs r0, #2
_0800F650:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800F658: .4byte EventEndTalk
