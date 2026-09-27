	.include "macro.inc"

	.syntax unified

	thumb_func_start IsFirstPlaythrough
IsFirstPlaythrough: @ 0x0802DEEC
	push {lr}
	bl IsGamePlayedThrough
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802DEFC
	movs r0, #1
	b _0802DF1A
_0802DEFC:
	ldr r1, _0802DF14 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	bne _0802DF18
	adds r0, r1, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	b _0802DF1A
	.align 2, 0
_0802DF14: .4byte 0x0202BBF8
_0802DF18:
	movs r0, #0
_0802DF1A:
	pop {r1}
	bx r1
	.align 2, 0
