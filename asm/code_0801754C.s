	.include "macro.inc"

	.syntax unified

	thumb_func_start GetFreeUnit
GetFreeUnit: @ 0x0801754C
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r3, #0x40
	adds r2, r0, #1
	cmp r2, r3
	bge _0801757A
	ldr r5, _08017570 @ =0x08B92EB0
	movs r4, #0xff
_0801755C:
	adds r0, r2, #0
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0
	bne _08017574
	adds r0, r1, #0
	b _0801757C
	.align 2, 0
_08017570: .4byte 0x08B92EB0
_08017574:
	adds r2, #1
	cmp r2, r3
	blt _0801755C
_0801757A:
	movs r0, #0
_0801757C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
