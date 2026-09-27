	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08021E10
sub_08021E10: @ 0x08021E10
	push {lr}
	ldr r0, _08021E54 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08021E5C
	ldr r1, _08021E58 @ =0x0202BBB8
	adds r1, #0x3d
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08021E5C
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08021E5C
	adds r0, r2, #0
	bl MakeTradeTargetList
	bl CountTargets
	cmp r0, #0
	beq _08021E5C
	movs r0, #1
	b _08021E5E
	.align 2, 0
_08021E54: .4byte 0x03004690
_08021E58: .4byte 0x0202BBB8
_08021E5C:
	movs r0, #3
_08021E5E:
	pop {r1}
	bx r1
	.align 2, 0
