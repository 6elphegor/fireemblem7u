	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitFogViewRange
GetUnitFogViewRange: @ 0x080175BC
	adds r2, r0, #0
	ldr r0, _080175E4 @ =0x0202BBF8
	ldrb r3, [r0, #0xd]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080175D6
	adds r3, #5
_080175D6:
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r0, r3, r0
	bx lr
	.align 2, 0
_080175E4: .4byte 0x0202BBF8
