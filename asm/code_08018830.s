	.include "macro.inc"

	.syntax unified

	thumb_func_start UpdatePrevDeployStates
UpdatePrevDeployStates: @ 0x08018830
	push {r4, r5, lr}
	movs r4, #1
	ldr r5, _08018868 @ =0x08B92EB0
_08018836:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	adds r3, r2, #0
	cmp r2, #0
	beq _08018872
	ldr r0, [r2]
	cmp r0, #0
	beq _08018872
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0801886C
	movs r0, #0x80
	lsls r0, r0, #0xd
	orrs r1, r0
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0xc]
	b _08018872
	.align 2, 0
_08018868: .4byte 0x08B92EB0
_0801886C:
	ldr r0, _08018884 @ =0xFFEFFFFF
	ands r1, r0
	str r1, [r3, #0xc]
_08018872:
	adds r4, #1
	cmp r4, #0x3f
	ble _08018836
	bl sub_0807A8B8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08018884: .4byte 0xFFEFFFFF
