	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801D51C
sub_0801D51C: @ 0x0801D51C
	push {lr}
	adds r0, #0x4c
	movs r1, #0x10
	strh r1, [r0]
	bl InitBmBgLayers
	ldr r2, _0801D548 @ =0x030028AC
	ldr r0, _0801D54C @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	ldr r1, _0801D550 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0801D548: .4byte 0x030028AC
_0801D54C: .4byte 0x0000FFE0
_0801D550: .4byte 0x0000E0FF
