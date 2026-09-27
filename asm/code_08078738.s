	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08078738
sub_08078738: @ 0x08078738
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r3, #0x1a]
	cmp r0, r1
	bne _0807875C
	ldrb r0, [r3, #0x1b]
	cmp r0, r2
	bne _0807875C
	ldr r0, [r3]
	ldr r1, [r0, #4]
	str r1, [r3, #4]
	ldrh r0, [r0, #2]
	str r0, [r3, #8]
	movs r0, #1
	b _0807875E
_0807875C:
	movs r0, #0
_0807875E:
	bx lr
