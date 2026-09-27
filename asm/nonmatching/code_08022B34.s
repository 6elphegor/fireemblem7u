	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022B34
sub_08022B34: @ 0x08022B34
	push {r4, lr}
	ldr r4, _08022B58 @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022B52
	adds r0, r2, #0
	bl sub_08024094
	bl CountTargets
	cmp r0, #0
	bne _08022B5C
_08022B52:
	movs r0, #3
	b _08022B70
	.align 2, 0
_08022B58: .4byte 0x03004690
_08022B5C:
	ldr r1, [r4]
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #3
	beq _08022B6E
	movs r0, #1
	b _08022B70
_08022B6E:
	movs r0, #2
_08022B70:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
