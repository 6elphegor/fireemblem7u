	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803A420
sub_0803A420: @ 0x0803A420
	push {r4, r5, lr}
	bl GetActiveFactionAlliance
	adds r4, r0, #1
	adds r0, #0x80
	cmp r4, r0
	bge _0803A43C
	adds r5, r0, #0
_0803A430:
	adds r0, r4, #0
	bl GetUnit
	adds r4, #1
	cmp r4, r5
	blt _0803A430
_0803A43C:
	ldr r0, _0803A44C @ =0x0203A8EC
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803A44C: .4byte 0x0203A8EC
