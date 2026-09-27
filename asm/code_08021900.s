	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08021900
sub_08021900: @ 0x08021900
	push {lr}
	ldr r0, _08021938 @ =0x03004690
	ldr r3, [r0]
	ldr r2, [r3, #0xc]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _08021940
	ldr r1, _0802193C @ =0x0202BBB8
	adds r1, #0x3d
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08021940
	movs r0, #0x10
	ands r2, r0
	cmp r2, #0
	beq _08021940
	adds r0, r3, #0
	bl sub_08024018
	bl CountTargets
	cmp r0, #0
	beq _08021940
	movs r0, #1
	b _08021942
	.align 2, 0
_08021938: .4byte 0x03004690
_0802193C: .4byte 0x0202BBB8
_08021940:
	movs r0, #3
_08021942:
	pop {r1}
	bx r1
	.align 2, 0
