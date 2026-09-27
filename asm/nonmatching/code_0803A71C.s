	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803A71C
sub_0803A71C: @ 0x0803A71C
	push {lr}
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	ldr r0, _0803A744 @ =0x0203A8EC
	adds r0, #0x86
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803A74C
	ldr r0, _0803A748 @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803A74C
	movs r0, #1
	b _0803A74E
	.align 2, 0
_0803A744: .4byte 0x0203A8EC
_0803A748: .4byte 0x03004690
_0803A74C:
	movs r0, #0
_0803A74E:
	pop {r1}
	bx r1
	.align 2, 0
