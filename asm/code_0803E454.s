	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803E454
sub_0803E454: @ 0x0803E454
	adds r3, r0, #0
	ldr r2, _0803E470 @ =0x08B98C9C
	ldr r0, _0803E474 @ =0x0203D90C
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r2, [r0]
	cmp r1, #1
	beq _0803E478
	ldr r0, [r3, #0x3c]
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrh r0, [r0, #2]
	b _0803E48C
	.align 2, 0
_0803E470: .4byte 0x08B98C9C
_0803E474: .4byte 0x0203D90C
_0803E478:
	ldr r0, [r3, #0x3c]
	cmp r0, #0
	beq _0803E488
	ldr r0, _0803E484 @ =0x000003C1
	b _0803E48C
	.align 2, 0
_0803E484: .4byte 0x000003C1
_0803E488:
	movs r0, #0xf0
	lsls r0, r0, #2
_0803E48C:
	bx lr
	.align 2, 0
