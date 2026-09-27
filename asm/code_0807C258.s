	.include "macro.inc"

	.syntax unified

	thumb_func_start QuintessenceFx_OnEnd
QuintessenceFx_OnEnd: @ 0x0807C258
	push {lr}
	ldr r0, _0807C2B4 @ =0x08CA7794
	bl Proc_Find
	bl Proc_End
	movs r0, #0
	bl SetOnHBlankA
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _0807C2B8 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r3, _0807C2BC @ =0x03002870
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
	pop {r0}
	bx r0
	.align 2, 0
_0807C2B4: .4byte 0x08CA7794
_0807C2B8: .4byte 0x02023C60
_0807C2BC: .4byte 0x03002870
