	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807CF2C
sub_0807CF2C: @ 0x0807CF2C
	push {r4, lr}
	ldr r4, _0807CF5C @ =0x0203A85C
	ldrb r0, [r4, #0x11]
	cmp r0, #0x17
	bne _0807CF60
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r4, [r4, #0x12]
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	adds r4, r0, #0
	movs r0, #0x6b
	bl GetItemIndex
	cmp r4, r0
	bne _0807CF60
	movs r0, #1
	b _0807CF62
	.align 2, 0
_0807CF5C: .4byte 0x0203A85C
_0807CF60:
	movs r0, #0
_0807CF62:
	pop {r4}
	pop {r1}
	bx r1
