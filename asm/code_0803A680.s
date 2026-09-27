	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803A680
sub_0803A680: @ 0x0803A680
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2]
	ldr r0, _0803A6AC @ =0x0203A988
	ldrb r1, [r1, #4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803A6B4
	ldr r0, _0803A6B0 @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803A6B4
	movs r0, #1
	b _0803A6B6
	.align 2, 0
_0803A6AC: .4byte 0x0203A988
_0803A6B0: .4byte 0x03004690
_0803A6B4:
	movs r0, #0
_0803A6B6:
	pop {r1}
	bx r1
	.align 2, 0
