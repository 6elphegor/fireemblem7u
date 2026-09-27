	.include "macro.inc"

	.syntax unified

	thumb_func_start HasConvoyAccess
HasConvoyAccess: @ 0x0802E818
	push {r4, lr}
	movs r4, #1
_0802E81C:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0802E854
	ldr r3, [r2]
	cmp r3, #0
	beq _0802E854
	ldr r0, [r2, #0xc]
	ldr r1, _0802E850 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0802E854
	ldr r0, [r2, #4]
	ldr r1, [r3, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0802E854
	movs r0, #1
	b _0802E85C
	.align 2, 0
_0802E850: .4byte 0x0001000C
_0802E854:
	adds r4, #1
	cmp r4, #0x3f
	ble _0802E81C
	movs r0, #0
_0802E85C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
