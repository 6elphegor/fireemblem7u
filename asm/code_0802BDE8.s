	.include "macro.inc"

	.syntax unified

	thumb_func_start RemoveMapChangeTrap
RemoveMapChangeTrap: @ 0x0802BDE8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802BDF0 @ =0x0203A518
	b _0802BE06
	.align 2, 0
_0802BDF0: .4byte 0x0203A518
_0802BDF4:
	cmp r0, #3
	bne _0802BE04
	ldrb r0, [r4, #3]
	cmp r0, r5
	bne _0802BE04
	adds r0, r4, #0
	bl RemoveTrap
_0802BE04:
	adds r4, #8
_0802BE06:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802BDF4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
