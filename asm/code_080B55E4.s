	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B55E4
sub_080B55E4: @ 0x080B55E4
	push {r4, r5, lr}
	ldr r5, _080B561C @ =0x08C9CDA4
	ldr r4, _080B5620 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x79
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _080B5616
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x79
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	bl sub_0800AF5C
_080B5616:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B561C: .4byte 0x08C9CDA4
_080B5620: .4byte 0x0202BBF8
