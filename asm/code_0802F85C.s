	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802F85C
sub_0802F85C: @ 0x0802F85C
	push {lr}
	adds r2, r0, #0
	ldr r1, _0802F890 @ =0x0203A3D8
	movs r0, #0x80
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0802F884
	ldr r0, _0802F894 @ =0x0203A3F0
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802F88C
	ldr r0, _0802F898 @ =0x0203A470
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802F88C
_0802F884:
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
_0802F88C:
	pop {r0}
	bx r0
	.align 2, 0
_0802F890: .4byte 0x0203A3D8
_0802F894: .4byte 0x0203A3F0
_0802F898: .4byte 0x0203A470
