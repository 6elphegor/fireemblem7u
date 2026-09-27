	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079AF4
sub_08079AF4: @ 0x08079AF4
	push {lr}
	bl EndPlayerPhaseSideWindows
	ldr r0, _08079B18 @ =0x0202BBF8
	movs r1, #2
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	bne _08079B06
	movs r1, #1
_08079B06:
	adds r0, r1, #0
	bl GetUnitFromCharId
	movs r1, #0
	bl sub_0802CC88
	pop {r0}
	bx r0
	.align 2, 0
_08079B18: .4byte 0x0202BBF8
