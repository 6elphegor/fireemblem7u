	.include "macro.inc"

	.syntax unified

	thumb_func_start EventMovementWait
EventMovementWait: @ 0x0800D2F4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl MuExistsActive
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _0800D310
	ldr r0, _0800D318 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	str r4, [r5, #0x40]
_0800D310:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D318: .4byte 0x0202E3F4
