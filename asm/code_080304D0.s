	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080304D0
sub_080304D0: @ 0x080304D0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _08030514 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _080304E8
	movs r1, #1
_080304E8:
	adds r0, #0x86
	adds r0, r0, r1
	ldrb r5, [r0]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _08030500
	movs r1, #1
_08030500:
	adds r0, #0x88
	adds r0, r0, r1
	ldrb r2, [r0]
	adds r0, r6, #0
	adds r1, r5, #0
	bl EnsureCameraOntoPosition
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08030514: .4byte 0x0202BBF8
