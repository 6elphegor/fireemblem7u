	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08093E2C
sub_08093E2C: @ 0x08093E2C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08093E80 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08093E52
	ldr r0, _08093E84 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093E52
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_08093E52:
	ldr r0, _08093E80 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08093E78
	ldr r0, _08093E84 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093E72
	ldr r0, _08093E88 @ =0x00000385
	bl m4aSongNumStart
_08093E72:
	adds r0, r4, #0
	bl Proc_Break
_08093E78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08093E80: .4byte 0x08B857F8
_08093E84: .4byte 0x0202BBF8
_08093E88: .4byte 0x00000385
