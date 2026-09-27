	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08073ABC
sub_08073ABC: @ 0x08073ABC
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _08073AEC @ =0x0203A85C
	ldrb r1, [r0, #0xc]
	adds r0, r1, #0
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0xc]
	ldr r1, _08073AEC @ =0x0203A85C
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	ldr r1, _08073AEC @ =0x0203A85C
	movs r2, #0x14
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	bl StartAvailableDoorTileEvent
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073AEC: .4byte 0x0203A85C
