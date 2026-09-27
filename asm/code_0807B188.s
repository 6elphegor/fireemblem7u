	.include "macro.inc"

	.syntax unified

	thumb_func_start DragonGatefx_End
DragonGatefx_End: @ 0x0807B188
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _0807B1D4 @ =0x06003000
	ldr r2, _0807B1D8 @ =0x01000C00
	mov r0, sp
	bl CpuFastSet
	movs r0, #0
	bl SetOnHBlankA
	ldr r3, _0807B1DC @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0807B1D4: .4byte 0x06003000
_0807B1D8: .4byte 0x01000C00
_0807B1DC: .4byte 0x03002870
